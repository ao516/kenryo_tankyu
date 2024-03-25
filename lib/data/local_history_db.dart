import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const int _version = 4;
const String _databaseName = 'history.db';

//フィールド作成用の定数
const String fieldName = 'History';
const String documentID = 'documentID';
const String isFavorite = 'isFavorite';
const String title = 'title';
const String category1 = 'category1';
const String subCategory1 = 'subCategory1';
const String category2 = 'category2';
const String subCategory2 = 'subCategory2';
const String year = 'year';
const String course = 'course';
const String eventName = 'eventName';
const String author = 'author';

final historyAsyncNotifierProvider =
    AsyncNotifierProvider<HistoryAsyncNotifier, List<History>?>(
        HistoryAsyncNotifier.new);

class HistoryAsyncNotifier extends AsyncNotifier<List<History>?> {
  /// 初期データの読み込み
  @override
  Future<List<History>?> build() async {
    return await getAllHistory();
  }

  ///毎回読み込ませなきゃいけないやつ
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $fieldName('
          '$documentID INTEGER PRIMARY KEY, '
          '$isFavorite INTEGER NOT NULL, '
          '$title TEXT NOT NULL, '
          '$category1 TEXT NOT NULL, '
          '$subCategory1 TEXT NOT NULL, '
          '$category2 TEXT NOT NULL, '
          '$subCategory2 TEXT NOT NULL, '
          '$year INTEGER NOT NULL, '
          '$course TEXT NOT NULL, '
          '$eventName TEXT NOT NULL, '
          '$author TEXT NOT NULL'
          ');',
        );
      },
      version: _version,
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

  Future<void> insertHistory(History history) async {
    try {
      // stateをローディングにする（値がまだ利用可能でない状態）
      state = const AsyncValue.loading();
      final Database db = await database;
      await db.insert(
        'history',
        history.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      state = AsyncValue.data(await getAllHistory());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current); //todo statcktrace.currentって何？笑
    }
  }

  Future<void> changeFavoriteState(History history) async {
    try {
      // stateをローディングにする（値がまだ利用可能でない状態）
      state = const AsyncValue.loading();
      final Database db = await database;
      await db.update(
        'history',
        {'isFavorite': history.isFavorite == 1 ? 0 : 1},
        where: 'documentID = ?',
        whereArgs: [history.documentID],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      state = AsyncValue.data(await getAllHistory());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current); //todo statcktrace.currentって何？笑
    }
  }
}

//model
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
      required this.author});

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
        author = item["author"];

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
      'author': author
    };
  }
}
