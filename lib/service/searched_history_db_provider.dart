import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



final searchedHistoryProvider = FutureProvider.family
    .autoDispose<List<Searched>?, bool>((ref, onlyShowFavorite) async {
  return onlyShowFavorite
      ? await SearchedHistoryController.instance.getFavoriteHistory()
      : await SearchedHistoryController.instance.getAllHistory();
});

class SearchedHistoryController {
  //シングルトンインスタンスを作成
  //TODO この辺よくわかってないよーう。
  //外部からこのコンストラクタを呼び出すことはできません (`_` を接頭辞につけることでプライベートにします)
  static final SearchedHistoryController _instance = SearchedHistoryController._();
  SearchedHistoryController._();
  // シングルトンインスタンスにアクセスするための公開メソッド↓
  static SearchedHistoryController get instance => _instance;
  //こうすることのメリットは、このクラスのインスタンスが1つしか生成されないことを保証することができること。？？？？

  Future<Database> get database async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'searched_history.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE searched_history('
            'documentID TEXT PRIMARY KEY NOT NULL, '
            'isFavorite INTEGER NOT NULL, '
            'title TEXT NOT NULL, '
            'category1 TEXT NOT NULL, '
            'subCategory1 TEXT NOT NULL, '
            'category2 TEXT NOT NULL, '
            'subCategory2 TEXT NOT NULL, '
            'year INTEGER NOT NULL, '
            'course TEXT NOT NULL, '
            'eventName TEXT NOT NULL, '
            'savedAt TEXT NOT NULL, '
            'CHECK(LENGTH(documentID) == 8),'
            'CHECK(savedAt != null) '
            ');',
          );
        },
        version: 3,
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<List<Searched>?> getAllHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('searched_history', orderBy: 'savedAt DESC');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => Searched.fromSQLite(maps[index]));
  }

  Future<List<Searched>?> getFavoriteHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('searched_history',
        where: 'isFavorite = ?', whereArgs: [1], orderBy: 'savedAt DESC');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => Searched.fromSQLite(maps[index]));
  }

  Future<void> changeFavoriteState(
      String documentID, int nextIsFavorite) async {
    try {
      final Database db = await database;
      await db.update(
        'searched_history',
        {'isFavorite':nextIsFavorite},
        where: 'documentID = ?',
        whereArgs: [documentID],
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<List<String>?>? getSomeFavoriteState(List<String> documentIDs) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('searched_history',
        where:
            'isFavorite = ? AND documentID IN (${List.filled(documentIDs.length, '?').join(',')}) ',
        whereArgs: [1, ...documentIDs]);
    //ドキュメントIDが存在し、かつお気に入りに登録されているもののみをヒットさせ、List<Searched>?型で返却。存在しない場合はnullになる。
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => maps[index]['documentID']);
  }

  Future<int?> getFavoriteState(String documentID) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('searched_history',
        where: 'documentID = ? AND isFavorite = ?', whereArgs: [documentID, 1]);
    if (maps.isEmpty) {
      return null;
    }
    return maps[0]['isFavorite'];
  }

  Future<void> insertHistory(Searched searched) async {
    final Database db = await database;
    await db.insert(
      'searched_history',
      searched.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteHistory(String documentID) async {
    final Database db = await database;
    await db.delete(
      'searched_history',
      where: 'documentID = ?',
      whereArgs: [documentID],
    );
  }
}
