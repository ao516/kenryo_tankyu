import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeachersPage extends StatelessWidget {
  TeachersPage(this.subjectNumber, {super.key});

  static const List<List<String>> teacherList = [
    ['日下部英司'],
    ['塩原潤'],
    ['伊藤'],
    ['金澤大典'],
    [''],
    ['農業', '水産業', '林業'],
    ['スポーツ', '幼児教育', '教育'],
    ['水資源', '森資源', '生物', '地学', 'エシカル'],
    ['数学', '化学', '物理'],
    ['コンピューター', 'ロボット', '機械工学', 'ＩＣＴ'],
    ['健康', '美容', '医療'],
    ['アート', 'デザイン', '音楽'],
    ['食', '学校生活', '図書'],
  ];

  int subjectNumber;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: ListTile(
            trailing: const Icon(Icons.navigate_next),
            title: Text(teacherList[subjectNumber][index]),
            onTap: () {
              context.go('/test/teacherList/teacher',extra: teacherList[subjectNumber][index]);
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
    );
  }
}
