import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

import '../providers/search_provider.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});
  static final _items = [
    ['社会・地域', 'images/category/society.png'],
    ['人文・歴史', 'images/category/history.png'],
    ['人権\nジェンダー', 'images/category/right.png'],
    ['国際', 'images/category/global.png'],
    ['ビジネス\n経済', 'images/category/business.png'],
    ['一次産業', 'images/category/agriculture.png'],
    ['スポーツ\n教育', 'images/category/school.png'],
    ['自然環境', 'images/category/environment.png'],
    ['科学・数学', 'images/category/science.png'],
    ['テクノロジー\n工学', 'images/category/technology.png'],
    ['健康・医療', 'images/category/health.png'],
    ['デザイン\nアート', 'images/category/art.png'],
    ['くらし', 'images/category/life.png'],
    ['その他', 'images/category/other.png'],
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryNotifier = ref.read(searchProvider.notifier);
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                context.push('/subCategory');
                categoryNotifier.selectedCategory(categoryList[index]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _items[index][0],
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      _items[index][1],
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
