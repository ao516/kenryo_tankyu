import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';

class SubCategorySelectPage extends StatelessWidget {
  SubCategorySelectPage(this.index, {super.key});
  int index;

  final _items = [
    '社会・地域',
    '人文・歴史',
    '人権・ジェンダー',
    '国際',
    'ビジネス・経済',
    '一次産業',
    'スポーツ・教育',
    '自然環境',
    '科学・数学',
    'テクノロジー・工学',
    '健康・医療',
    'デザイン・アート',
    'くらし',
    'その他'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InitialHeader(categoryWord: _items[index]),
      body: SubCategory(index),
    );
  }
}
