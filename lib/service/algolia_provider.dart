import 'dart:math';

import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/service/random_recommended_cache.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'algolia.dart';

final forceRefreshProvider = StateProvider.autoDispose<bool>((ref) => false);

final algoliaSearchProvider =
    FutureProvider.autoDispose<List<Searched>?>((ref) async {
  final search =
      ref.read(searchProvider); //ref.readにすると、watchと違って値が変更されたときに再ビルドされない！
  final String searchWord = search.searchWord != null
      ? search.searchWord!.map<String>((String value) => value).join(',')
      : '';
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
    debugPrint('ヒットしてます。内容: ${objects.toString()}');
    if (objects.isEmpty) {
      debugPrint('検索結果がありません');
      return null;
    } else {

      ///ヒットしたデータがユーザーがお気に入りに登録しているかどうかをローカルDBから取得する。
      ///ある場合は、favoriteListにそのデータのdocumentIDを入手、ない場合はnullをいれる。
      final List<int> documentIDs = objects.map((e) => int.parse(e.objectID)).toList();
      final List<String>? favoriteList =
          await SearchedHistoryController.instance.getSomeFavoriteState(documentIDs);

      ///Algoliaから取得したデータをSearched型に変換する。
      ///この際、favoriteListにidが含まれているかどうかを検証しながらstateに渡すdataを作成している。
      if (favoriteList == null) {
        return objects.map((e) => Searched.fromAlgolia(e, 0)).toList();
      } else {
        return objects.map((object) {
          return favoriteList.contains(object.objectID)
              ? Searched.fromAlgolia(object, 1)
              : Searched.fromAlgolia(object, 0);
        }).toList();
      }
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
  searchState.year != null ? str += ' AND year:${searchState.year}' : null;
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
        state = [...state]..sort((a, b) => b.year.compareTo(a.year));
        debugPrint('新しい順で並び替えます');
        break;
      case SortType.oldOrder:
        state = [...state]..sort((a, b) => a.year.compareTo(b.year));
        debugPrint('古い順で並び替えます');
        break;
      case SortType.likeOrder:
        state = [...state]
          ..sort((a, b) => b.vagueLikes?.compareTo(a.vagueLikes as num) ?? 0);
        debugPrint('いいね順で並び替えます');
        break;
    }
    state = state;
  }
}

final randomAlgoliaSearchProvider =
    FutureProvider.autoDispose<List<Searched>?>((ref) async {
  final isForce = ref.watch(forceRefreshProvider);
  final data = await RandomRecommendedCacheController.instance.getAllCache();
  if (isForce == false &&
      data != null &&
      data.isNotEmpty &&
      data[0].savedAt != null &&
      data[0].savedAt!.difference(DateTime.now()).inDays < 3) {
    //キャッシュが3日以内のものであればそれを返す。
    debugPrint('キャッシュから取得します');
    ref.read(forceRefreshProvider.notifier).state = false;
    return data;
  }

  debugPrint('Algoliaから取得します');

  int randomNumber1 =
      Random().nextInt(4); //0~3の乱数を生成。この数はalgoliaに入っているデータの数に合わせる。
  int randomNumber2;
  do {
    randomNumber2 = Random().nextInt(4);
  } while (randomNumber1 == randomNumber2);

  AlgoliaQuery algoliaQuery = Application.algolia.instance.index('firestore');
  final data1 = await _getQuery(algoliaQuery, randomNumber1);
  final data2 = await _getQuery(algoliaQuery, randomNumber2);

  final isFavorite1 = await SearchedHistoryController.instance
      .getFavoriteState(int.parse(data1.objectID));
  final isFavorite2 = await SearchedHistoryController.instance
      .getFavoriteState(int.parse(data2.objectID));
  if (isFavorite1 == null && isFavorite2 == null) {
    RandomRecommendedCacheController.instance.insertMultipleCache(
        Searched.fromAlgolia(data1, 0), Searched.fromAlgolia(data2, 0));
    return [Searched.fromAlgolia(data1, 0), Searched.fromAlgolia(data2, 0)];
  } else {
    RandomRecommendedCacheController.instance.insertMultipleCache(
        Searched.fromAlgolia(data1, 0), Searched.fromAlgolia(data2, 0));
    return [
      isFavorite1 == 1
          ? Searched.fromAlgolia(data1, 1)
          : Searched.fromAlgolia(data1, 0),
      isFavorite2 == 1
          ? Searched.fromAlgolia(data2, 1)
          : Searched.fromAlgolia(data2, 0)
    ];
  }
});

Future<AlgoliaObjectSnapshot> _getQuery(
    AlgoliaQuery algoliaQuery, int randomNumber) async {
  AlgoliaQuery query = algoliaQuery.setHitsPerPage(1).setPage(randomNumber);
  final data = await query.getObjects();
  return data.hits[0];
}
