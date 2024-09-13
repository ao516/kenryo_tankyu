import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RandomRecommendedCacheController {
  static final RandomRecommendedCacheController _instance =
      RandomRecommendedCacheController._();
  RandomRecommendedCacheController._();
  static RandomRecommendedCacheController get instance => _instance;

  Future<Database> get database async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'random_recommended_cache.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE random_recommended_cache('
            'recommendedNumber INTEGER PRIMARY KEY NOT NULL, '
            'documentID TEXT NOT NULL, '
            'isFavorite INTEGER NOT NULL, '
            'title TEXT NOT NULL, '
            'category1 TEXT NOT NULL, '
            'subCategory1 TEXT NOT NULL, '
            'category2 TEXT NOT NULL, '
            'subCategory2 TEXT NOT NULL, '
            'year INTEGER NOT NULL, '
            'course TEXT NOT NULL, '
            'eventName TEXT NOT NULL, '
            'CHECK(LENGTH(documentID) == 8),'
            ');',
          );
        },
        version: 1,

        ///recommendedNumberには1か2しか入らない。homePageでの表示順で保管されてます。
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<void> insertMultipleCache(
      Searched searched1, Searched searched2) async {
    final Database db = await database;
    final json1 = searched1.toJson();
    json1['recommendedNumber'] = 1;
    final json2 = searched2.toJson();
    json2['recommendedNumber'] = 2;
    final List<Map<String, dynamic>> maps = [
      json1,
      json2,
    ];
    await db.transaction((txn) async {
      for (final map in maps) {
        await txn.insert('random_recommended_cache', map,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    });
  }
}
