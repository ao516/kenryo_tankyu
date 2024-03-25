import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final isFavoriteProvider = StateProvider.family.autoDispose<int, History>((ref, history) {
  //int型を返す。1がお気に入り、0がお気に入りじゃない
  return history.isFavorite;
});

final historyProvider = FutureProvider.family.autoDispose<List<History>?,bool>((ref,onlyShowFavorite) async {
  return onlyShowFavorite ? await HistoryController().getFavoriteHistory() :
    await HistoryController().getAllHistory();
});

class HistoryController {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'history.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history('
              'documentID INTEGER PRIMARY KEY, '
              'isFavorite INTEGER NOT NULL, '
              'title TEXT NOT NULL, '
              'category1 TEXT NOT NULL, '
              'subCategory1 TEXT NOT NULL, '
              'category2 TEXT NOT NULL, '
              'subCategory2 TEXT NOT NULL, '
              'year INTEGER NOT NULL, '
              'course TEXT NOT NULL, '
              'eventName TEXT NOT NULL, '
              'author TEXT NOT NULL, '
              'createdAt TEXT NOT NULL'
              ');',
        );
      },
      version:3,
    );
  }
  Future<List<History>?> getAllHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('history');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => History.fromMap(maps[index]));
  }
  Future<List<History>?> getFavoriteHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('history', where: 'isFavorite = ?', whereArgs: [1]);
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => History.fromMap(maps[index]));
  }
  Future<void> changeFavoriteState(History history) async {
    final Database db = await database;
    await db.update(
      'history',
      {'isFavorite': history.isFavorite == 1 ? 0 : 1},
      where: 'documentID = ?',
      whereArgs: [history.documentID],
    );
  }
  Future<void> insertHistory(History history) async {
    final Database db = await database;
    await db.insert(
      'history',
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}



//モデル
class History {
  final int? documentID;
  final int isFavorite;
  final String title;
  final String category1;
  final String subCategory1;
  final String category2;
  final String subCategory2;
  final int year;
  final String course;
  final String eventName;
  final String author;
  final DateTime createdAt;

  const History(
      {this.documentID,
        required this.isFavorite,
        required this.title,
        required this.category1,
        required this.subCategory1,
        required this.category2,
        required this.subCategory2,
        required this.year,
        required this.course,
        required this.eventName,
        required this.author,
        required this.createdAt,
      });

  History.fromMap(Map<String, dynamic> item)
      : documentID = item["documentID"],
        isFavorite = item["isFavorite"],
        title = item["title"],
        category1 = item["category1"],
        subCategory1 = item["subCategory1"],
        category2 = item["category2"],
        subCategory2 = item["subCategory2"],
        year = item["year"],
        course = item["course"],
        eventName = item["eventName"],
        author = item["author"],
        createdAt = DateTime.parse(item["createdAt"]);

  Map<String, dynamic> toMap() {
    return {
      'documentID': documentID,
      'isFavorite': isFavorite,
      'title': title,
      'category1': category1,
      'subCategory1': subCategory1,
      'category2': category2,
      'subCategory2': subCategory2,
      'year': year,
      'course': course,
      'eventName': eventName,
      'author': author,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

