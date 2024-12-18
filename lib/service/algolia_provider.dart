import 'dart:math';

import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/db/recommended_works_db.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/db/searched_history_db.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'algolia.dart';

final forceRefreshProvider = StateProvider.autoDispose<bool>((ref) => false);

final algoliaSearchProvider =
    FutureProvider.autoDispose<List<Searched>?>((ref) async {
  final search =
      ref.read(searchProvider); //ref.readにすると、watchと違って値が変更されたときに再ビルドされない！
  final String searchWord =
      search.searchWord.map<String>((String value) => value).join(',');
  final String filter = _filter(search); //フィルターに使う文字列を決定する関数。

  debugPrint('filter : $filter');

  try {
    AlgoliaQuery algoliaQuery = Application.algolia.instance
        .index('firestore')
        .setPage(0); //TODO ヒットさせるページ。あとで変更。
    algoliaQuery = filter != ''
        ? algoliaQuery.query(searchWord).filters(filter)
        : algoliaQuery.query(searchWord);

    final AlgoliaQuerySnapshot snap = await algoliaQuery.getObjects();
    final List<AlgoliaObjectSnapshot> objects = snap.hits;
    if (objects.isEmpty) {
      //検索してもヒットしなかった場合
      return null;
    } else {
      // ヒットしたデータがユーザーのお気に入りに登録されているかをローカルDBから取得
      final List<int> documentIDs =
          objects.map((e) => int.parse(e.objectID)).toList();
      final List<int>? favoriteList = await SearchedHistoryController.instance
          .getSomeFavoriteState(documentIDs);
      // Algoliaから取得したデータをSearched型に変換し、favoriteListに基づいてお気に入り状態を設定
      return objects.map((object) {
        final isFavorite =
            favoriteList?.contains(int.parse(object.objectID)) ?? false;
        return Searched.fromAlgolia(object, isFavorite);
      }).toList();
    }
  } catch (error, stackTrace) {
    return Future.error(error, stackTrace);
  }
});

String _filter(Search searchState) {
  String str = '';
  searchState.subCategory.name != 'none'
      ? str +=
          'AND (subCategory1:${searchState.subCategory.name} OR subCategory2:${searchState.subCategory.name})'
      : searchState.category.name != 'none'
          ? str +=
              'AND (category1:${searchState.category.name} OR category2:${searchState.category.name})'
          : null;
  searchState.enterYear.name != 'undefined'
      ? str += ' AND enterYear:${searchState.enterYear.displayName}'
      : null;
  searchState.course.name != 'undefined'
      ? str += ' AND course:${searchState.course}'
      : null;
  str != '' ? str = str.substring(4, str.length) : null;
  return str;
}

final sortedListProvider =
    StateNotifierProvider.autoDispose<SortedListNotifier, List<Searched>>(
        (ref) {
  // dataProviderの結果を初期値として並び替えリストを管理
  final data = ref.watch(algoliaSearchProvider).asData?.value ?? [];
  return SortedListNotifier(data);
});

class SortedListNotifier extends StateNotifier<List<Searched>> {
  SortedListNotifier(super.state);

  void sortList(SortType sortType) {
    switch (sortType) {
      case SortType.newOrder:
        state = [...state]..sort((a, b) =>
            b.enterYear.displayName.compareTo(a.enterYear.displayName));
        debugPrint('新しい順で並び替えます');
        break;
      case SortType.oldOrder:
        state = [...state]..sort((a, b) =>
            a.enterYear.displayName.compareTo(b.enterYear.displayName));
        debugPrint('古い順で並び替えます');
        break;
      case SortType.likeOrder:
        state = [...state]
          ..sort((a, b) => b.vagueLikes.compareTo(a.vagueLikes));
        debugPrint('いいね順で並び替えます');
        break;
    }
    state = state;
  }
}

final randomAlgoliaSearchProvider =
    FutureProvider.autoDispose<List<Searched>>((ref) async {
  final isForce = ref.read(forceRefreshProvider);
  final data = await RecommendedWork.load();
  debugPrint(data.toString());
  if (isForce == false &&
      data.isNotEmpty &&
      data[0].savedAt != null &&
      data[0].savedAt!.difference(DateTime.now()).inDays < 3) {
    //キャッシュが3日以内のものであればそれを返す。
    debugPrint('キャッシュから取得します');
    ref.read(forceRefreshProvider.notifier).state = false;
    return data;
  } else {
    debugPrint('Algoliaから取得します');

    int randomNumber1 =
        Random().nextInt(250); //0~3の乱数を生成。この数はalgoliaに入っているデータの数に合わせる。
    //TODO　この乱数の生成方法は、Algoliaに入っているデータの数に合わせる必要がある。最終調整必須。
    int randomNumber2;
    do {
      randomNumber2 = Random().nextInt(250);
    } while (randomNumber1 == randomNumber2);

    AlgoliaQuery algoliaQuery = Application.algolia.instance.index('firestore');
    final data1 = await _getQuery(algoliaQuery, randomNumber1);
    final data2 = await _getQuery(algoliaQuery, randomNumber2);

    final favoriteList = await SearchedHistoryController.instance
        .getSomeFavoriteState(
            [int.parse(data1.objectID), int.parse(data2.objectID)]);
    final List<Searched> result = [
      Searched.fromAlgolia(
          data1, favoriteList?.contains(int.parse(data1.objectID)) ?? false),
      Searched.fromAlgolia(
          data2, favoriteList?.contains(int.parse(data2.objectID)) ?? false)
    ];
    await RecommendedWork.save(result[0], result[1]);
    return result;
  }
});

Future<AlgoliaObjectSnapshot> _getQuery(
    AlgoliaQuery algoliaQuery, int randomNumber) async {
  AlgoliaQuery query = algoliaQuery.setHitsPerPage(1).setPage(randomNumber);
  final data = await query.getObjects();
  return data.hits[0];
}
