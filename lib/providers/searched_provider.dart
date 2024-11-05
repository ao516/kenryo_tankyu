import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/db/searched_history_db.dart';
import 'package:kenryo_tankyu/models/models.dart';

//全画面表示ボタンを表示するかしないかを管理するprovider
final showFullScreenButtonProvider =
    StateProvider.autoDispose<bool>((ref) => true);

//全画面か詳細画面かどうかを管理するprovider。IndexedStackに使用
final isFullScreenProvider = StateProvider.autoDispose<bool>((ref) => false);

//同じ探究作品を見ている最中なのかどうかを管理するprovider
//このproviderを導入することによって、全画面に切り替えたときに不用意な再ビルドを防ぐ。
final isSameScreenProvider = StateProvider.autoDispose<bool>((ref) => false);

//調べている探究作品がキャッシュから取得したものかどうかを管理するProvider
final isGetDataFromCache = StateProvider.autoDispose<bool>((ref) => false);
//todo ほんとはここはtrueにしないといけないけど、エラーが起きてしまっているため一時的にfalseにしている。

//firestoreからデータを取得するProvider
final getFirestoreSearchedProvider =
    FutureProvider.family.autoDispose<Searched, int>((ref, documentID) async {
  final firestore = FirebaseFirestore.instance;
  final isFavorite =
      await SearchedHistoryController.instance.getFavoriteState(documentID);
  final cacheNotifier = ref.read(isGetDataFromCache.notifier);
  final getDataFromCache = ref.watch(isGetDataFromCache);
  try {
    if (getDataFromCache) {
      //キャッシュから取得
      final snapshot = await firestore
          .collection('works')
          .doc(documentID.toString())
          .get(const GetOptions(source: Source.cache));
      if (snapshot.exists) {
        cacheNotifier.state = true;
        final data = Searched.fromFirestore(snapshot, isFavorite);
        return data;
      } else {
        //キャッシュに存在しない場合はサーバーから取得
        final serverSnapshot = await firestore
            .collection('works')
            .doc(documentID.toString())
            .get(const GetOptions(source: Source.server));
        cacheNotifier.state = false;
        final data = Searched.fromFirestore(serverSnapshot, isFavorite);
        return data;
      }
    } else {
      //サーバーから取得
      final snapshot = await firestore
          .collection('works')
          .doc(documentID.toString())
          .get(const GetOptions(source: Source.server));
      cacheNotifier.state = false;
      final data = Searched.fromFirestore(snapshot, isFavorite);
      return data;
    }
  } catch (e) {
    // エラーハンドリング
    throw Exception('Failed to fetch data: $e');
  }
});

//choiceChipの選択肢を管理する簡易的なProvider
final intProvider = StateProvider.autoDispose((ref) => 0);
final stringProvider =
    StateProvider.autoDispose((ref) => '22202363'); //TODO 初期値これ升田さんのやつ。
