import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:path/path.dart';


final searchHistoryProvider = FutureProvider.autoDispose<List<Search>?>((ref) async {
  return await SearchHistoryController.instance.getAllHistory();
});

class SearchHistoryController {
  static final SearchHistoryController _instance = SearchHistoryController._();
  SearchHistoryController._();
  static SearchHistoryController get instance => _instance;

  Future<Database> get database async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'search_history.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE search_history('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'category TEXT NOT NULL, '
            'subCategory TEXT DEFAULT "", '
            'year INTEGER DEFAULT 0, '
            'eventName TEXT DEFAULT "", '
            'course TEXT DEFAULT "", '
            'searchWord TEXT DEFAULT "", '
            'savedAt TEXT NOT NULL, '
            'numberOfHits INTEGER, '
            'CHECK(category != "" OR subCategory != "" OR year != 0 OR eventName != "" OR course != "" OR searchWord != "") '
            'UNIQUE(category, subCategory, year, eventName, course, searchWord) '
            ');',
          );
        },
        version: 15,
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<void> deleteAllHistory() async {
    final Database db = await database;
    await db.delete('search_history');
  }

  Future<void> insertHistory(Search search) async {
    final Database db = await database;
    await db.insert(
      'search_history',
      search.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Search>?> getAllHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('search_history', orderBy: 'savedAt DESC');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (i) {
      debugPrint(maps[i].toString());
      return Search.fromJson(maps[i]);
    });
  }
}