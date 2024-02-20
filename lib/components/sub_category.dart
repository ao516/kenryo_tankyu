import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubCategory extends StatelessWidget {
  SubCategory(this.number, {super.key});
  int number; //何のカテゴリなのかが入ってくる  ex.) 0 --> 地域・社会

  final _items = [
    ['防災', '観光', '市政', '政治'],
    ['歴史', '言語', '地理', '心理', '哲学'],
    ['ジェンダー', '子供の権利', '貧困'],
    ['国際協力', '海外問題'],
    ['ビジネス', 'マーケティング', '経済', 'エシカル消費'],
    ['農業', '水産業', '林業'],
    ['スポーツ', '幼児教育', '学校教育'],
    ['水資源', '森資源', '生物', '地学', 'エシカル'],
    ['数学', '化学', '物理'],
    ['コンピューター', 'ロボット', '機械工学', 'ＩＣＴ'],
    ['健康', '美容', '医療'],
    ['アート', 'デザイン', '音楽'],
    ['食', '学校生活', '図書'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: const Icon(Icons.navigate_next),
          title: Text(_items[number][index]),
          onTap: () => context.push('/resultList', extra: _items[number][index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
            height: 1,
            color: Colors.grey,
          ),
        );
      },
      itemCount: _items[number].length,
    );
  }
}
