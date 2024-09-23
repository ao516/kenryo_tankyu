import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
            'CHECK(LENGTH(id) == 8 OR LENGTH(id) == 5),'
            'CHECK(pdfData != null) '
            ');',
          );
        },
        version: 3,
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

  Future<Uint8List?> getLocalPdf(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('works_pdf',
        columns: ['pdfData'], where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      return null;
    }
    debugPrint('ローカルに保管されたpdfを取得しました。');
    return maps[0]['pdfData'];
  }

  Future<Uint8List?> getRemotePdf(String id) async {
    final pathReference = FirebaseStorage.instance.ref().child('works/$id.pdf');
    const storage = 1024 * 1024 * 3;

    ///これ以上のサイズ（3MB）のファイルは読み込めないように設定してあります。
    final Uint8List? remoteData = await pathReference.getData(storage);
    remoteData != null
        ? await PdfDbController.instance.insertPdf(id, remoteData)
        : null;
    debugPrint('リモートに保管されたpdfを取得しました。');
    return remoteData;
  }

  Future<Uint8List?> getRemotePdfForTeacher(String id) async {
    final pathReference = FirebaseStorage.instance.ref().child('teachers/$id.pdf');
    const storage = 1024 * 1024 * 3;

    ///これ以上のサイズ（3MB）のファイルは読み込めないように設定してあります。
    final Uint8List? remoteData = await pathReference.getData(storage);
    remoteData != null
        ? await PdfDbController.instance.insertPdf(id, remoteData)
        : null;
    debugPrint('リモートに保管されたpdfを取得しました。');
    return remoteData;
  }
}