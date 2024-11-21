import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kenryo_tankyu/models/models.dart';

class NotificationDbController {
  static Future<Database> get database async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'notification.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE notification('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'type TEXT NOT NULL, '
            'headerImageUrl TEXT NOT NULL, '
            'title TEXT NOT NULL, '
            'contents TEXT NOT NULL, '
            'sendAt TEXT NOT NULL, '
            'savedAt TEXT NOT NULL, '
            'isRead INTEGER NOT NULL, '
            'CHECK(title != "" OR contents != "") '
            ');',
          );
        },
        version: 1,
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  static Future<void> insert(Notification notification) async {
    final Database db = await database;
    await db.insert(
      'notification',
      notification.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Notification>?> read(int paging) async {
    //TODO pagingは未実装
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notification');
    return List.generate(maps.length, (i) {
      return Notification.fromSQLite(maps[i]);
    });
  }
}
