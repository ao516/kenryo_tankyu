import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/constant/teacher_list.dart';
import 'package:kenryo_tankyu/model/teacher.dart';

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