import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'algolia.dart';

final algoliaNotifierProvider = StateNotifierProvider.autoDispose<
    AlgoliaNotifier, AsyncValue<List<Searched>>>((ref) {
  return AlgoliaNotifier();
});

class AlgoliaNotifier extends StateNotifier<AsyncValue<List<Searched>>> {
  AlgoliaNotifier() : super(const AsyncValue.loading());

  Future<void> fetchData(WidgetRef ref) async {
    final searchState = ref.watch(searchProvider);
    final String searchWord = searchState.searchWord != null
        ? searchState.searchWord!.map<String>((String value) => value).join(',')
        : '';
    final String filter = _filter(searchState); //フィルターに使う文字列を決定する関数。

    state = const AsyncValue.loading();

    try {
      AlgoliaQuery algoliaQuery = Application.algolia.instance
          .index('firestore')
          .setLength(5); //TODO ヒットさせる件数は後で変更する。
      algoliaQuery = filter != ''
          ? algoliaQuery.query(searchWord).filters(filter)
          : algoliaQuery.query(searchWord);

      final AlgoliaQuerySnapshot snap = await algoliaQuery.getObjects();
      final List<AlgoliaObjectSnapshot> objects = snap.hits;

      ///ヒットしたデータがユーザーがお気に入りに登録しているかどうかをローカルDBから取得する。
      final List<String> documentIDs = objects.map((e) => e.objectID).toList();
      final List<String>? favoritedList =
          await HistoryController().getFavoriteState(documentIDs);

      debugPrint(favoritedList.toString()); //TODO いつか消去 ここは通ってる？

      if (favoritedList == null) {
        state = AsyncValue.data(
            objects.map((e) => Searched.fromAlgolia(e, 0)).toList());
      } else {
        final List<Searched> searchedList = objects.map((object) {
          return favoritedList.contains(object.objectID)
              ? Searched.fromAlgolia(object, 1)
              : Searched.fromAlgolia(object, 0);
        }).toList();
        state = AsyncValue.data(searchedList);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
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
