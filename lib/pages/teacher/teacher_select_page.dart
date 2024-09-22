import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/model/teacher.dart';
import 'package:kenryo_tankyu/service/teacher_sort_provider.dart';

import '../../constant/constant.dart';


class TeacherSelectPage extends ConsumerWidget {
  const TeacherSelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherList = ref.watch(teacherSortedListProvider);
    final sortedType = ref.watch(sortedTypeForTeacherProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('縣陵先生図鑑'),actions: [
        PopupMenuButton(itemBuilder: (context) {
          return SortTypeForTeacher.values
              .map((e) => PopupMenuItem(
                    onTap: () {
                        ref.read(teacherSortedListProvider.notifier).sortList(e);
                        ref.read(sortedTypeForTeacherProvider.notifier).state = e;
                    },
                    value: e,
                    child: Text(e.name),
                  ))
              .toList();
        },icon: const Icon(Icons.sort),),
      ],),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: Row(
                children: [
                  Chip(
                      avatar: CircleAvatar(
                        backgroundColor: sortedType == SortTypeForTeacher.gradeOrder
                            ? teacherList[index].grade.color
                            : teacherList[index].subject.color,
                      ),
                      label: Text(
                          sortedType == SortTypeForTeacher.gradeOrder
                              ? teacherList[index].grade.name
                              : teacherList[index].subject.name)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(teacherList[index].name),
                ],
              ),
              onTap: () {
                context.push('/teacher/showPdf');
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              height: 3,
              color: Colors.grey,
            ),
          );
        },
        itemCount: teacherList.length,
      ),
    );
  }
}
