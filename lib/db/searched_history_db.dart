import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

final searchedHistoryProvider = FutureProvider.family
    .autoDispose<List<Searched>?, bool>((ref, onlyShowFavorite) async {
  return onlyShowFavorite
      ? await SearchedHistoryController.instance.getFavoriteHistory()
      : await SearchedHistoryController.instance.getAllHistory();
});

class SearchedHistoryController {
  //シングルトンインスタンスを作成
  //外部からこのコンストラクタを呼び出すことはできません (`_` を接頭辞につけることでプライベートにします)
  static final SearchedHistoryController _instance =
      SearchedHistoryController._();
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
            'documentID INTEGER PRIMARY KEY NOT NULL, '
            'isFavorite INTEGER NOT NULL, '
            'category1 TEXT NOT NULL, '
            'subCategory1 TEXT NOT NULL, '
            'category2 TEXT NOT NULL, '
            'subCategory2 TEXT NOT NULL, '
            'enterYear INTEGER NOT NULL, '
            'eventName TEXT NOT NULL, '
            'course TEXT NOT NULL, '
            'title TEXT NOT NULL, '
            'author TEXT NOT NULL, '
            'vagueLikes INTEGER NOT NULL, '
            'exactLikes INTEGER NOT NULL, '
            'existsSlide INTEGER NOT NULL, '
            'existsReport INTEGER NOT NULL, '
            'existsThesis INTEGER NOT NULL, '
            'existsPoster INTEGER NOT NULL, '
            'savedAt TEXT NOT NULL, '
            'CHECK(LENGTH(documentID) == 8),'
            'CHECK(savedAt != null) '
            ');',
          );
        },
        version: 7,
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
    final List<Searched> searchedList = List.generate(
        maps.length, (index) => Searched.fromSQLite(maps[index]));
    return searchedList;
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

  Future<void> changeFavoriteState(int documentID, bool nextIsFavorite) async {
    final int isFavorite = nextIsFavorite ? 1 : 0;
    try {
      final Database db = await database;
      await db.update(
        'searched_history',
        {'isFavorite': isFavorite},
        where: 'documentID = ?',
        whereArgs: [documentID],
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<List<int>?>? getSomeFavoriteState(List<int> documentIDs) async {
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

  Future<bool> getFavoriteState(int documentID) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('searched_history',
        where: 'documentID = ? AND isFavorite = ?', whereArgs: [documentID, 1]);
    if (maps.isEmpty) {
      return false;
    }
    final bool isFavorite = maps[0]['isFavorite'] == 1;
    return isFavorite;
  }

  Future<void> insertHistory(Searched searched) async {
    final Database db = await database;
    final json = searched.toSQLite();
    await db.insert(
      'searched_history',
      json,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<Searched?> getHistory(int documentID) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('searched_history',
        where: 'documentID = ?', whereArgs: [documentID]);
    if (maps.isEmpty) {
      return null;
    } else {
      return Searched.fromSQLite(maps[0]);
    }
  }

  Future<void> deleteHistory(int documentID) async {
    final Database db = await database;
    await db.delete(
      'searched_history',
      where: 'documentID = ?',
      whereArgs: [documentID],
    );
  }
}