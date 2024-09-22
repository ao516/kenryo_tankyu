import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

//調べている探究作品がキャッシュから取得したものかどうかを管理するProvider
final isCachedProvider = StateProvider.autoDispose<bool>((ref) => false);

//全画面表示ボタンを表示するかしないかを管理するprovider
final showFullScreenButtonProvider =
StateProvider.autoDispose<bool>((ref) => true);

//全画面か詳細画面かどうかを管理するprovider。IndexedStackに使用
final isFullScreenProvider = StateProvider.autoDispose<bool>((ref) => false);

//同じ探究作品を見ている最中なのかどうかを管理するprovider
//このproviderを導入することによって、全画面に切り替えたときに不用意な再ビルドを防ぐ。
final isSameScreenProvider = StateProvider.autoDispose<bool>((ref) => false);

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


//choiceChipの選択肢を管理する簡易的なProvider
final intProvider = StateProvider.autoDispose((ref) => 0);
final stringProvider =
    StateProvider.autoDispose((ref) => '22202363'); //TODO 初期値これ升田さんのやつ。
