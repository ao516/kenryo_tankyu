import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/searched.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//firestoreからデータを取得するProvider
final searchedProvider = FutureProvider.autoDispose
    .family<Searched, String>((ref, documentId) async {
  final firestore = FirebaseFirestore.instance;
  final snapshot = await firestore.collection('works').doc(documentId).get();
  return Searched.fromJson(snapshot.data()!);
});

//pdfを保管するprovider
final slidePdfProvider = FutureProvider.family<Uint8List,String>((ref, id) async {
  final pathReference = FirebaseStorage.instance.ref().child('test/$id.pdf');
  final Uint8List? data = await pathReference.getData();
  return data!;
});