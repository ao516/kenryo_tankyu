import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

//firestoreからデータを取得するProvider
final searchedProvider = FutureProvider.family
    .autoDispose<Searched?, Searched>((ref, searched) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final DocumentSnapshot snapshot =
        await firestore.collection('works').doc(searched.documentID).get();

    if (snapshot.exists) {
      debugPrint('やるよー');
      return Searched.fromFirestore(snapshot, searched.isFavorite);
    } else {
      debugPrint('firestoreにデータが存在しません。');
      return null;
    }
  } catch (e) {
    debugPrint('firestoreからデータを取得できませんでした。');
  }
});

//pdfを保管するprovider
final slidePdfProvider =
    FutureProvider.family<Uint8List, String>((ref, id) async {
  final pathReference = FirebaseStorage.instance.ref().child('test/$id.pdf');
  final Uint8List? data = await pathReference.getData();
  return data!;
});
