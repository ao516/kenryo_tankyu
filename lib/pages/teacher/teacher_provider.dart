import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teacherPdfProvider = FutureProvider.family<Uint8List?, String>((ref, pdfPath)async{
  final pathReference = FirebaseStorage.instance.ref().child('teacher/$pdfPath.pdf');
  const oneMegabyte = 1024 * 1024;
  final Uint8List? data = await pathReference.getData(oneMegabyte);
  return data;
});

final selectedTeacherProvider = StateProvider<String>((ref) => '初期値');
final teacherPdfPathProvider = StateProvider<String>((ref) => 'sample');