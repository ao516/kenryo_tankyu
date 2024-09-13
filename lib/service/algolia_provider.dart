import 'dart:math';

import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/service/random_recommended_cache.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'algolia.dart';

final algoliaSearchProvider = FutureProvider
    .autoDispose<List<Searched>?>((ref) async {
  final search = ref.read(searchProvider); //ref.readにすると、watchと違って値が変更されたときに再ビルドされない！
  final String searchWord = search.searchWord != null
      ? search.searchWord!.map<String>((String value) => value).join(',')
      : '';
  final String filter = _filter(search); //フィルターに使う文字列を決定する関数。

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
      return null; //TODO ここ上手く動いていない。
    } else {

      ///ヒットしたデータがユーザーがお気に入りに登録しているかどうかをローカルDBから取得する。
      ///ある場合は、favoriteListにそのデータのdocumentIDを入手、ない場合はnullをいれる。
      final List<String> documentIDs = objects.map((e) => e.objectID).toList();
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
  searchState.subCategory != null
      ? str +=
          'AND (subCategory1:${searchState.subCategory} OR subCategory2:${searchState.subCategory})'
      : searchState.category != null
          ? str +=
              'AND (category1:${searchState.category} OR category2:${searchState.category})'
          : null;
  searchState.year != null ? str += ' AND year:${searchState.year}' : null;
  searchState.course != null
      ? str += ' AND course:${searchState.course}'
      : null;
  str != '' ? str = str.substring(4, str.length) : null;
  return str;
}


final sortedListProvider = StateNotifierProvider.autoDispose<SortedListNotifier, List<Searched>>((ref) {
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
        state = [...state]..sort((a, b) => b.vagueLikes?.compareTo(a.vagueLikes as num) ?? 0);
        debugPrint('いいね順で並び替えます');
        break;
    }
    state = state;
  }
}


final randomAlgoliaSearchProvider = FutureProvider.autoDispose<List<Searched>?> ((ref)async {
  int randomNumber1 = Random().nextInt(4); //0~3の乱数を生成。この数はalgoliaに入っているデータの数に合わせる。
  int randomNumber2;
  do {
    randomNumber2 = Random().nextInt(4);
  } while (randomNumber1 == randomNumber2);

  AlgoliaQuery algoliaQuery = Application.algolia.instance
      .index('firestore');
  final data1 = await _getQuery(algoliaQuery, randomNumber1);
  final data2 = await _getQuery(algoliaQuery, randomNumber2);

  //ここでalgoliaから取得してきたデータが既にお気に入りに登録してあるかどうかを取得。
  final List<String> documentIDs = [data1.objectID, data2.objectID];
  final List<String>? favoriteList =
      await SearchedHistoryController.instance.getSomeFavoriteState(documentIDs);
  if (favoriteList == null) {
    RandomRecommendedCacheController.instance.insertMultipleCache(Searched.fromAlgolia(data1, 0), Searched.fromAlgolia(data2, 0));
    return [Searched.fromAlgolia(data1, 0), Searched.fromAlgolia(data2, 0)];
  } else {
    RandomRecommendedCacheController.instance.insertMultipleCache(, searched2)
    return [
      favoriteList.contains(data1.objectID)
          ? Searched.fromAlgolia(data1, 1)
          : Searched.fromAlgolia(data1, 0),
      favoriteList.contains(data2.objectID)
          ? Searched.fromAlgolia(data2, 1)
          : Searched.fromAlgolia(data2, 0)
    ];
  }
}
);

Future<AlgoliaObjectSnapshot> _getQuery(AlgoliaQuery algoliaQuery, int randomNumber) async{
  AlgoliaQuery query = algoliaQuery.setHitsPerPage(1).setPage(randomNumber);
  final data = await query.getObjects();
  return data.hits[0];
}
