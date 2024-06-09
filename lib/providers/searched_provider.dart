import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/providers/providers.dart';


//firestoreからデータを取得するProvider
final getFirestoreSearchedProvider = FutureProvider.family
    .autoDispose<Searched?, Searched>((ref, searched) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final DocumentSnapshot snapshot =
        await firestore.collection('works').doc(searched.documentID).get();

    if (snapshot.exists) {
      final data = Searched.fromFirestore(snapshot, searched.isFavorite);
      ref.read(searchedProvider.notifier).state = data; //ここでfuture型でないproviderに値を代入してい
      return data;
    } else {
      debugPrint('firestoreにデータが存在しません。');
      return null;
    }
  } catch (e) {
    debugPrint('firestoreからデータを取得できませんでした。');
  }
  return null;
});

final searchedProvider = StateProvider<Searched>((ref) => testSearchedValue);

//pdfを保管するprovider
final slidePdfProvider =
    FutureProvider.family<Uint8List?, String>((ref, id) async {
  final pathReference = FirebaseStorage.instance.ref().child('test/$id.pdf');
  const storage = 1024 * 1024*3; ///これ以上のサイズのファイルは読み込めない。１度にキャッシュさせないとsyncfusion_pdfは機能しないのかも。
  final Uint8List? data = await pathReference.getData(storage);
  return data;
});

//choiceChipの選択肢を管理する簡易的なProvider
final intProvider = StateProvider.autoDispose((ref) => 0);
final stringProvider = StateProvider.autoDispose((ref) => '10320224'); //TODO 初期値これ良くないかな。
