import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';
import 'algolia.dart';

final algoliaNotifierProvider = StateNotifierProvider<AlgoliaNotifier,
    AsyncValue<List<AlgoliaObjectSnapshot>>>((ref) {
  return AlgoliaNotifier();
});

class AlgoliaNotifier
    extends StateNotifier<AsyncValue<List<AlgoliaObjectSnapshot>>> {
  AlgoliaNotifier() : super(const AsyncValue.loading());

  Future<void> fetchData(WidgetRef ref) async {
    final searchState = ref.watch(searchProvider);
    final String searchWord = searchState.searchWord != null
        ? searchState.searchWord!.map<String>((String value) => value).join(',')
        : '';
    final String filter = _filter(searchState); //フィルターに使う文字列を決定する関数。

    state = const AsyncValue.loading();
    AlgoliaQuery algoliaQuery =
        Application.algolia.instance.index('firestore').setLength(5);
    algoliaQuery = filter != ''
        ? algoliaQuery.query(searchWord).filters(filter)
        : algoliaQuery.query(searchWord);

    final AlgoliaQuerySnapshot snap = await algoliaQuery.getObjects();
    final List<AlgoliaObjectSnapshot> objects = snap.hits;

    debugPrint('検索ワード: $searchWord\nフィルター: $filter\n検索結果: $objects');
    state = AsyncValue.data(objects);
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
    searchState.course != null
        ? str += ' AND course:${searchState.course}'
        : null;
    str != '' ? str = str.substring(4, str.length) : null;
    return str;
  }
}
