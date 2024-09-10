import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/pdf_db.dart';

//調べている探究作品がキャッシュから取得したものかどうかを管理するProvider
final isCachedProvider = StateProvider.autoDispose<bool>((ref) => false);

//firestoreからデータを取得するProvider
final getFirestoreSearchedProvider = FutureProvider.family
    .autoDispose<Searched?, Searched>((ref, searched) async {
  final firestore = FirebaseFirestore.instance;

  ///todo まだキャッシュに関しての理解が薄い。また書き直したい。
  //まずはキャッシュから取得してみる
  try {
    final DocumentSnapshot snapshot = await firestore
        .collection('works')
        .doc(searched.documentID)
        .get(const GetOptions(source: Source.cache));
    if (snapshot.exists) {
      final data = Searched.fromFirestore(snapshot, searched.isFavorite);
      ref.read(isCachedProvider.notifier).state = true;
      ref.read(searchedProvider.notifier).state =
          data; //ここでfuture型でないproviderに値を代入している
      return data;
    } else {
      debugPrint('firestoreにデータが存在しません。');
      return null;
    }
  } catch (e) {
    //キャッシュがない場合はサーバーから取得
    final DocumentSnapshot snapshot = await firestore
        .collection('works')
        .doc(searched.documentID)
        .get(const GetOptions(source: Source.server));
    if (snapshot.exists) {
      final data = Searched.fromFirestore(snapshot, searched.isFavorite);
      ref.read(searchedProvider.notifier).state =
          data; //ここでfuture型でないproviderに値を代入してい
      return data;
    } else {
      debugPrint('firestoreにデータが存在しません。');
      return null;
    }
  }


});


final searchedProvider = StateProvider<Searched>((ref) => testSearchedValue1);

//pdfを保管するprovider
final slidePdfProvider =
    FutureProvider.family<Uint8List?, String>((ref, id) async {
  final Uint8List? localData = await PdfDbController.instance.getPdf(id);
  if (localData != null) {
    debugPrint('ローカルデータを取得しました。');
    return localData;
  }
  final pathReference = FirebaseStorage.instance.ref().child('works/$id.pdf');
  const storage = 1024 * 1024 * 3;
  ///これ以上のサイズのファイルは読み込めない。１度にキャッシュさせないとsyncfusion_pdfは機能しないのかも。
  final Uint8List? remoteData = await pathReference.getData(storage);
  remoteData != null ? await PdfDbController.instance.insertPdf(id, remoteData) : null;
  debugPrint('リモートデータを取得しました。');
  return remoteData;
});

//choiceChipの選択肢を管理する簡易的なProvider
final intProvider = StateProvider.autoDispose((ref) => 0);
final stringProvider =
    StateProvider.autoDispose((ref) => '22202363'); //TODO 初期値これ良くないかな。
