import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/components/favorite.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultList extends StatelessWidget {
  final List<Searched> data;
  const ResultList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final Searched searched = data[index];
          return Consumer(builder: (context, ref, child) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: searched.year % 3 == 0
                                      ? Colors.red
                                      : searched.year % 3 == 1
                                          ? Colors.green
                                          : Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('${searched.year.toString()}年度入学'),
                              const SizedBox(width: 8),
                              Text(searched.course),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(searched.title,
                              style: const TextStyle(fontSize: 20),
                              softWrap: true),
                          const SizedBox(height: 4),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Chip(
                                    label: Text(
                                      '${searched.category1} > ${searched.subCategory1}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    padding: EdgeInsets.zero),
                                const SizedBox(width: 8),
                                Chip(
                                    label: Text(
                                        '${searched.category2} > ${searched.subCategory2}',
                                        style: const TextStyle(fontSize: 14)),
                                    visualDensity:
                                        const VisualDensity(vertical: -4),
                                    padding: EdgeInsets.zero),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/category/art.png'),
                            width: 50,
                            height: 50,
                          ),
                          FavoriteForResultListPage(
                              vagueLikes: searched.vagueLikes ?? 0,
                              isFavorite: searched.isFavorite),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                ///詳細画面への遷移と、履歴の追加
                context.push('/result', extra: searched);
                HistoryController().insertHistory(Searched(
                    documentID: searched.documentID,
                    isFavorite: searched.isFavorite,
                    category1: searched.category1,
                    subCategory1: searched.subCategory1,
                    category2: searched.category2,
                    subCategory2: searched.subCategory2,
                    year: searched.year,
                    course: searched.course,
                    title: searched.title,
                    eventName: searched.eventName,
                    savedAt: DateTime.now()),
                );
              },
            );
          });
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
        itemCount: data.length,
      ),
    );
  }
}
