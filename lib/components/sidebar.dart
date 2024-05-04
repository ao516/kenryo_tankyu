import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/constant/value.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';
import 'package:kenryo_tankyu/service/service.dart';

//todo enumでメソッドやコンストラクタを引数に取りたいと思ってるができなくて葛藤中
enum SearchType {
  category('カテゴリ', [
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
  ]),
  year('年度', ['2018', '2019', '2020', '2021', '2022']),
  eventName('イベント名', ['信州学', '個人探究']),
  departure('学科指定', ['普通科', '探究科']),
  ;

  const SearchType(
    this.name,
    this.choices,
  );
  final String name;
  final List<String> choices;
}

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 16.0, top: 8.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.clear)),
                    const Expanded(child: Text('絞り込み')),
                    ElevatedButton(
                        onPressed: () =>
                            ref.read(searchProvider.notifier).deleteAllParameters(),
                        child: const Text('条件をクリア')), //TODO
                  ],
                ),
                Consumer(builder: (context, ref, child) {
                  final data = ref.watch(searchProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      SearchDropButton(
                          name: 'カテゴリ',
                          selectedText: data.category,
                          choices: categoryList),
                      const SizedBox(height: 15.0),
                      SearchDropButton(
                          name: '期間', selectedText: data.year?.toString(), choices: yearList.map((e)=> e.toString()).toList()),
                      const SizedBox(height: 15.0),
                      SearchDropButton(
                          name: 'イベント名',
                          selectedText: data.eventName,
                          choices: eventNameList),
                      const SizedBox(height: 15.0),
                      SearchDropButton(
                          name: '学科指定',
                          selectedText: data.course,
                          choices: departureList),
                      const SizedBox(height: 15.0),
                      const Text('サブカテゴリを選択'),
                      data.category != null
                          ? const SubCategoryChip()
                          : const Text('カテゴリを選択してください',style: TextStyle(fontSize: 20),),
                    ],
                  );
                }),

                const Spacer(),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ref.invalidate(algoliaSearchProvider);
                      }, child: const Text('再検索する')),
                ), //TODO
              ],
            ),
          ),
        ),
      ),
    );
  }
}
