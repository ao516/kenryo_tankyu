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
            'category TEXT, '
            'subCategory TEXT, '
            'year INTEGER, '
            'eventName TEXT, '
            'course TEXT, '
            'searchWord TEXT, '
            'savedAt TEXT NOT NULL, '
            'numberOfHits INTEGER, '
            'CHECK(savedAt != null) '
            'CHECK(category != null OR subCategory != null OR year != null OR eventName != null OR course != null OR searchWord != null) '
            'UNIQUE(category, subCategory, year, eventName, course, searchWord) '
            ');',
          );
        },
        version: 10,
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
      return Search.fromJson(maps[i]);
    });
  }
}