import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});
  final _items = [
    ['社会・地域','images/appIcon.png'],
    ['人文・歴史','images/appIcon.png'],
    ['人権\nジェンダー','images/appIcon.png'],
    ['国際','images/appIcon.png'],
    ['ビジネス\n経済','images/appIcon.png'],
    ['一次産業','images/appIcon.png'],
    ['スポーツ\n教育','images/appIcon.png'],
    ['自然環境','images/appIcon.png'],
    ['科学・数学','images/appIcon.png'],
    ['テクノロジー\n工学','images/appIcon.png'],
    ['健康・医療','images/appIcon.png'],
    ['デザイン\nアート','images/appIcon.png'],
    ['くらし','images/appIcon.png'],
    ['プロジェクト','images/appIcon.png'],
    ['その他','images/appIcon.png'],
  ];

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => context.push('/subCategory',extra: index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_items[index][0],style: const TextStyle(color: Colors.black),),
                  Image.asset(
                    _items[index][1],
                    width: 50,
                    height: 50,
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

