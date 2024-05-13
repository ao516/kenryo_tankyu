import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

import '../components/components.dart';

//firestoreからデータを取得するProvider
final searchedProvider = FutureProvider.family
    .autoDispose<Searched?, Searched>((ref, searched) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final DocumentSnapshot snapshot =
        await firestore.collection('works').doc(searched.documentID).get();

    if (snapshot.exists) {
      final data = Searched.fromFirestore(snapshot, searched.isFavorite);
      return data;
    } else {
      debugPrint('firestoreにデータが存在しません。');
      return null;
    }
  } catch (e) {
    debugPrint('firestoreからデータを取得できませんでした。');
  }
  return null;
});

//pdfを保管するprovider
final slidePdfProvider =
    FutureProvider.family<Uint8List?, String>((ref, id) async {
  final pathReference = FirebaseStorage.instance.ref().child('test/$id.pdf');
  final Uint8List? data = await pathReference.getData();
  return data;
});

//choiceChipの選択肢を管理する簡易的なProvider
final intProvider = StateProvider.autoDispose((ref) => 0);
final stringProvider = StateProvider.autoDispose((ref) => '10320224'); //TODO 初期値これ良くないかな。
