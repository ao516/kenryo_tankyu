import 'package:algolia/algolia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        .setLength(5); //TODO ヒットさせる件数は後で変更する。
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
          await HistoryController.instance.getSomeFavoriteState(documentIDs);

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