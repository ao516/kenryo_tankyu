import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final isFavoriteProvider =
    StateProvider.family.autoDispose<int, Searched>((ref, searched) {
  //int型を返す。1がお気に入り、0がお気に入りじゃない
  return searched.isFavorite;
});

final historyProvider = FutureProvider.family
    .autoDispose<List<Searched>?, bool>((ref, onlyShowFavorite) async {
  return onlyShowFavorite
      ? await HistoryController().getFavoriteHistory()
      : await HistoryController().getAllHistory();
});

class HistoryController {
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
            'CHECK(documentID != "empty"),'
            'CHECK(savedAt != null) '
            ');',
          );
        },
        version: 2,
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
        {'isFavorite': nextIsFavorite},
        where: 'documentID = ?',
        whereArgs: [documentID],
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }


  Future<List<String>?>? getFavoriteState(List<String> documentIDs) async {
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

  Future<void> insertHistory(Searched searched) async {
    final Database db = await database;
    debugPrint(searched.toString());
    debugPrint(searched.toJson().toString());
    await db.insert(
      'searched_history',
      searched.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
