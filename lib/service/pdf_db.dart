import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PdfDbController {
  static final PdfDbController _instance = PdfDbController._();
  PdfDbController._();
  static PdfDbController get instance => _instance;

  Future<Database> get database async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'works_pdf.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE works_pdf('
            'id TEXT PRIMARY KEY NOT NULL, '
            'pdfData BLOB NOT NULL, '
            'savedAt TEXT NOT NULL, '
            'CHECK(LENGTH(id) == 8),'
            'CHECK(pdfData != null) '
            ');',
          );
        },
        version: 2,
      );
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<void> insertPdf(String id, Uint8List pdfData) async {
    final Database db = await database;
    await db.insert(
      'works_pdf',
      {
        'id': id,
        'pdfData': pdfData,
        'savedAt': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Uint8List?> getPdf(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('works_pdf',
        columns: ['pdfData'], where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      return null;
    }
    return maps[0]['pdfData'];
  }
}