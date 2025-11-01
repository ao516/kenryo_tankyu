import 'dart:math';
import 'dart:convert';

// Using algoliasearch package; responses are handled as Maps (JSON-like hits).
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:algoliasearch/algoliasearch.dart';
import 'package:kenryo_tankyu/features/research_work/domain/models/models.dart';
import 'package:kenryo_tankyu/features/search/data/algolia.dart';
import 'package:kenryo_tankyu/features/search/domain/models/models.dart';
import 'package:kenryo_tankyu/features/search/presentation/providers/providers.dart';
import 'package:kenryo_tankyu/features/user_archive/data/datasources/datasources.dart';

final forceRefreshProvider = StateProvider.autoDispose<bool>((ref) => false);

final algoliaSearchProvider =
    FutureProvider.autoDispose<List<Searched>?>((ref) async {
  final search =
      ref.read(searchProvider); //ref.readにすると、watchと違って値が変更されたときに再ビルドされない！
  final String searchWord =
      search.searchWord.map<String>((String value) => value).join(',');
  final String filter = _filter(search); //フィルターに使う文字列を決定する関数。

  debugPrint('filter : $filter');
  final queryHits = SearchForHits(
    indexName: 'firestore',
    query: searchWord,
    filters: filter == '' ? null : filter,
    page: 0,
  );

  try {
    final SearchResponse response = await Application.algolia.searchIndex(request: queryHits);
    final List<Hit> hits = response.hits;
    if (hits.isEmpty) {
      //検索してもヒットしなかった場合
      return null;
    } else {
      // ヒットしたデータがユーザーのお気に入りに登録されているかをローカルDBから取得
      final List<int> documentIDs = hits
          .map((e) => int.parse(e.objectID)).toList();
      final List<int>? favoriteList = await SearchedHistoryController.instance
          .getSomeFavoriteState(documentIDs);
      // Algoliaから取得したデータをSearched型に変換し、favoriteListに基づいてお気に入り状態を設定
      return hits.map((object) {
        final isFavorite =
            favoriteList?.contains(int.parse(object['objectID'])) ?? false;
        return Searched.fromAlgolia(object, isFavorite);
      }).toList();
    }
  } catch (error, stackTrace) {
    return Future.error(error, stackTrace);
  }
});


// 検索条件に応じたfilter文字列を返す関数
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
      ? str += ' AND course:${searchState.course.name}'
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

    final query1 = SearchForHits(
      indexName: 'firestore',
      query: '',
      page: randomNumber1,
      hitsPerPage: 1,
    );
    final query2 = SearchForHits(
      indexName: 'firestore',
      query: '',
      page: randomNumber2,
      hitsPerPage: 1,
    );

    final SearchResponse resp1 = await Application.algolia.searchIndex(request: query1);
    final List<Hit> hits = resp1.hits;
    final objects = hits.map((e) => Searched.fromAlgolia(e, false)).toList();
    if (objects.isEmpty) {
      throw StateError('Algolia response for query1 contains no hits');
    }
    final SearchResponse resp2 = await Application.algolia.searchIndex(request: query2);
    final List<Hit> hits2 = resp2.hits;
    final List<Searched> objects2 = hits2.map((e) => Searched.fromAlgolia(e, false)).toList();
    if (objects2.isEmpty) {
      throw StateError('Algolia response for query2 contains no hits');
    }
    return [...objects, ...objects2];
  }
});