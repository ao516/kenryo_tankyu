// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// ///メモ。SQLiteはbool型をサポートしていないから、intの0と1で対応する！！！
// ///0→false 、1→trueでいくよー
//
//
//
//
// const int _version = 4;
// const String _databaseName = 'history.db';
//
// //フィールド作成用の定数
// const String fieldName = 'History';
// const String documentID = 'documentID';
// const String isFavorite = 'isFavorite';
// const String title = 'title';
// const String category1 = 'category1';
// const String subCategory1 = 'subCategory1';
// const String category2 = 'category2';
// const String subCategory2 = 'subCategory2';
// const String year = 'year';
// const String course = 'course';
// const String eventName = 'eventName';
// const String author = 'author';
//
// final databaseProvider = FutureProvider<Database>((ref) async {
//   return openDatabase(
//     join(await getDatabasesPath(), _databaseName),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE $fieldName('
//             '$documentID INTEGER PRIMARY KEY, '
//             '$isFavorite INTEGER NOT NULL, '
//             '$title TEXT NOT NULL, '
//             '$category1 TEXT NOT NULL, '
//             '$subCategory1 TEXT NOT NULL, '
//             '$category2 TEXT NOT NULL, '
//             '$subCategory2 TEXT NOT NULL, '
//             '$year INTEGER NOT NULL, '
//             '$course TEXT NOT NULL, '
//             '$eventName TEXT NOT NULL, '
//             '$author TEXT NOT NULL'
//             ');',
//       );
//     },
//     version: _version,
//   );
// });
//
// class HistoryController extends StateNotifier<AsyncValue<List<History>>> {
//   HistoryController(this.db) : super(const AsyncValue.loading()) {
//     getAllHistory();
//   }
//   final Database db;
//
//   Future<void> insertHistory(History history) async {
//     await db.insert(
//       'history',
//       history.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     getAllHistory();
//   }
//
//   Future<void> updateHistory(History history) async {
//     await db.update(
//       'history',
//       history.toMap(),
//       where: 'documentID = ?',
//       whereArgs: [history.documentID],
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     getAllHistory();
//   }
//
//   Future<int> deleteHistory(History history) async {
//     return await db.delete(
//       'history',
//       where: 'documentID = ?',
//       whereArgs: [history.documentID],
//     );
//   }
//
//   //全ての履歴を取得する
//   Future<List<History>?> getAllHistory() async {
//     final List<Map<String, dynamic>> maps = await db.query('history');
//
//     if (maps.isEmpty) {
//       return null;
//     }
//     return List.generate(maps.length, (index) => History.fromMap(maps[index]));
//   }
//
//   //お気に入りに登録したもののみを取得する
//   Future<List<History>?> getFavoriteHistory() async {
//     final List<Map<String, dynamic>> maps =
//     await db.query('history', where: 'isFavorite = 1');
//     if (maps.isEmpty) {
//       return null;
//     }
//     return List.generate(maps.length, (index) => History.fromMap(maps[index]));
//   }
//
//   //お気に入りの状態を変更する
//   Future<void> changeFavoriteState(History history) async {
//     await db.update(
//       'history',
//       {'isFavorite': history.isFavorite == 1 ? 0 : 1},
//       where: 'documentID = ?',
//       whereArgs: [history.documentID],
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     getAllHistory();
//   }
// }
