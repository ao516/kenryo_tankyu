import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import '../constant/constant.dart';
import '../db/db.dart';


//教師データを取得するProvider
final getFirestoreTeacherProvider = FutureProvider.autoDispose<List<Teacher>>((ref) async {
 try {
  final firestore = FirebaseFirestore.instance;
  final snapshot = await firestore.collection('teachers').orderBy('madeAt', descending: true).limit(1).get();
  final data = snapshot.docs.first.data();
  final List<dynamic> teacherList = data['teachers'];
  return teacherList.map((e) => Teacher.fromJson(e)).toList();
 } catch (e) {
  debugPrint("教師データ取得エラー: $e");
  return [];
 }
}

);
final selectedTeacherProvider =
    StateProvider<Teacher>((ref) => Teacher.empty());

final getPdfProvider = FutureProvider.autoDispose<Uint8List?>((ref) async {
  final selectedTeacher = ref.watch(selectedTeacherProvider);
  final localData =
      await PdfDbController.instance.getLocalPdf(selectedTeacher.id);
  if (localData != null) {
    return localData;
  }
  final remoteData =
      await PdfDbController.instance.getRemotePdfForTeacher(selectedTeacher.id);
  return remoteData;
});


final teacherSortedListProvider =
 StateNotifierProvider.autoDispose<TeacherSortedListNotifier, List<Teacher>>((ref){ 
  final data = ref.watch(getFirestoreTeacherProvider).asData?.value ?? [];
  return TeacherSortedListNotifier(data);
});

class TeacherSortedListNotifier extends StateNotifier<List<Teacher>> {
  TeacherSortedListNotifier(super.state);

  void sortList(SortTypeForTeacher sortType) {
    switch (sortType) {
      case SortTypeForTeacher.nameAscendingOrder:
        state = [...state]..sort((a, b) => a.nameKana.compareTo(b.nameKana));
        break;
      case SortTypeForTeacher.nameDescendingOrder:
        state = [...state]..sort((a, b) => b.nameKana.compareTo(a.nameKana));
        break;
      case SortTypeForTeacher.subjectOrder:
        state = [...state]..sort((a, b) => a.subject.index.compareTo(b.subject.index));
        break;
      case SortTypeForTeacher.gradeOrder:
        state = [...state]..sort((a, b) => a.gradeInCharge.index.compareTo(b.gradeInCharge.index));
        break;
    }
    state = state;
  }
}

final sortedTypeForTeacherProvider = StateProvider<SortTypeForTeacher>((ref) => SortTypeForTeacher.nameAscendingOrder);