import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/favorite.dart';

class ResultList extends StatelessWidget {
  const ResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('2023年度'),
                        const SizedBox(width: 8),
                        const Text('探究科'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('タイトル', style: TextStyle(fontSize: 20)),
                    const Row(
                      children: [
                        Chip(
                            label: Text(
                              '環境 > 生物保護',
                              style: TextStyle(fontSize: 14),
                            ),
                            visualDensity: VisualDensity(vertical: -4),
                            padding: EdgeInsets.zero),
                        SizedBox(width: 8),
                        Chip(
                            label: Text('地域 > 京都'),
                            visualDensity: VisualDensity(vertical: -4),
                            padding: EdgeInsets.zero),
                      ],
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Image(
                      image: AssetImage('images/category/art.png'),
                      width: 50,
                      height: 50,
                    ),
                    Favorite(),
                  ],
                ),
              ],
            ),
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
        itemCount: 5,
      ),
    );
  }
}
