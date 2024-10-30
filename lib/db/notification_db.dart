// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:kenryo_tankyu/models/models.dart';
//
// class NotificationDbController {
//   static final NotificationDbController _instance =
//       NotificationDbController._();
//   NotificationDbController._();
//   static NotificationDbController get instance => _instance;
//
//   Future<Database> get database async {
//     try {
//       return openDatabase(
//         join(await getDatabasesPath(), 'notification.db'),
//         onCreate: (db, version) {
//           return db.execute(
//             'CREATE TABLE notification('
//             'id INTEGER PRIMARY KEY AUTOINCREMENT,'
//             'title TEXT NOT NULL, '
//             'contents TEXT NOT NULL, '
//             'savedAt TEXT NOT NULL, '
//             'CHECK(title != "" OR contents != "") '
//             ');',
//           );
//         },
//         version: 1,
//       );
//     } catch (error, stackTrace) {
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<void> insertNotification(Notification notification) async {
//     final Database db = await database;
//     await db.insert(
//       'notification',
//       notification.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }
