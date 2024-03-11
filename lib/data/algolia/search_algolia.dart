import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';
import 'algolia.dart';

final searchedNotifierProvider =
    StateNotifierProvider<SearchedNotifier, AsyncValue<String>>((ref) {
  return SearchedNotifier();
});

class SearchedNotifier extends StateNotifier<AsyncValue<String>> {
  SearchedNotifier() : super(const AsyncValue.loading());

  Future<void> fetchData(WidgetRef ref) async {
    final searchState = ref.watch(searchProvider);
    final String searchWord = searchState.searchWord != null
        ? searchState.searchWord!.map<String>((String value) => value).join(',')
        : '';
    final String filter = _filter(searchState);//フィルターに使う文字列を決定する関数。

    state = const AsyncValue.loading();
    final AlgoliaQuery algoliaQuery = Application.algolia.instance
        .index('firestore')
        .setLength(3)
        .query(searchWord)
        .filters(filter);

    final AlgoliaQuerySnapshot snap = await algoliaQuery.getObjects();

    debugPrint('検索ワード: $searchWord\nフィルター: $filter');
    final List<AlgoliaObjectSnapshot> objects = snap.hits;
    state = AsyncValue.data(objects.toString());
  }


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
    searchState.departure != null
        ? str += ' AND course:${searchState.departure}'
        : null; //todo departureじゃなくてcourseに変える

    str = str.substring(4, str.length);
    return str;
  }
}
