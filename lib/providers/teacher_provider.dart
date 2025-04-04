import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import '../constant/constant.dart';
import '../db/db.dart';

final selectedTeacherProvider =
    StateProvider<Teacher>((ref) => teacherList[0]);

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


final teacherSortedListProvider = StateNotifierProvider.autoDispose<TeacherSortedListNotifier, List<Teacher>>((ref) => TeacherSortedListNotifier());

class TeacherSortedListNotifier extends StateNotifier<List<Teacher>> {
  TeacherSortedListNotifier() : super(teacherList);

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
        state = [...state]..sort((a, b) => a.grade.index.compareTo(b.grade.index));
        break;
    }
    state = state;
  }
}

final sortedTypeForTeacherProvider = StateProvider<SortTypeForTeacher>((ref) => SortTypeForTeacher.nameAscendingOrder);