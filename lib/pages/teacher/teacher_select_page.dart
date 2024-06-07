import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/pages/teacher/teacher_provider.dart';

class TeacherSelectPage extends ConsumerWidget {
  TeacherSelectPage({required this.subjectNumber, super.key});

  static const List<List<List<String>>> teacherList = [
    [
      ['日下部英司', '在籍中','kusakabe'],
      ['降籏史郎', '異動','hurihuri']
    ],
    [
      ['塩原潤', '在籍中']
    ],
    [
      ['伊藤', '在籍中']
    ],
    [
      ['金澤大典', '在籍中','kanazawa']
    ],
  ];

  int subjectNumber;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: Row(
                children: [
                  teacherList[subjectNumber][index][1] == '在籍中'
                      ? Chip(avatar: CircleAvatar(backgroundColor: Colors.green.shade200,),label: Text(teacherList[subjectNumber][index][1]))
                      : const Text(''),
                  const SizedBox(width: 10,),
                  Text(teacherList[subjectNumber][index][0]),
                ],
              ),
              onTap: () {
                ref.read(selectedTeacherProvider.notifier).state = teacherList[subjectNumber][index][0];
                ref.read(teacherPdfProvider(teacherList[subjectNumber][index][2]));
                context.push('/teacher/select/showPdf');
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
        itemCount: teacherList[subjectNumber].length,
      ),
    );
  }
}
