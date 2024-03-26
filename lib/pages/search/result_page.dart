import 'package:algolia/algolia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultPage extends ConsumerWidget {
  final Searched beforeSearched;
  const ResultPage({super.key, required this.beforeSearched});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searched = ref.watch(searchedProvider(beforeSearched));
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                //TODO: ダウンロード機能、いつかやる。
                debugPrint('未実装');
              },
              icon: const Icon(Icons.download),
            ),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('情報の変更を提案'),
                ),
                const PopupMenuItem(
                  child: Text('情報をクリップボードにコピー'),
                ),
              ];
            })
          ],
        ),
        body: searched.when(
            data: (searched) {
              debugPrint('searched: $searched');
              if (searched == null) {
                return const Text('データがありません。');
              } else {
                final partOfId = searched.documentID.substring(1);
                final list = [];
                if (searched.existsSlide!) list.add('スライド');
                if (searched.existsReport!) list.add('レポート');
                if (searched.existsPoster!) list.add('ポスター');
                if (searched.existsThesis!) list.add('論文');

                ///todo 最初に呼び出すpdfを決定している。ちょっとコード汚いな…。
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(stringProvider.notifier).state = list[0] == 'スライド'
                      ? '1$partOfId'
                      : list[0] == 'レポート'
                          ? '2$partOfId'
                          : list[0] == 'ポスター'
                              ? '3$partOfId'
                              : '4$partOfId';
                });
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Column(children: [
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
                        Text('${searched.year.toString()}年度入学'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Flexible(
                          child: Text(
                        searched.title,
                        softWrap: true,
                        style: const TextStyle(fontSize: 20),
                      )),
                    ),
                    FavoriteForResultPage(
                        exactLikes: searched.exactLikes ?? 0,
                        isFavorite: searched.isFavorite),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Table(
                        border: TableBorder.symmetric(
                            inside:
                                const BorderSide(width: 1, color: Colors.grey)),
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(5),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            const Center(
                                child: Text('学科 ／ 名前',
                                    style: TextStyle(color: Colors.grey))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 8.0, bottom: 8.0),
                              child: Text('${searched.course} あと名前',
                                  style: const TextStyle(fontSize: 16)),
                            ),
                          ]),
                          TableRow(children: [
                            const Center(
                                child: Text('カテゴリ1',
                                    style: TextStyle(color: Colors.grey))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 8.0, bottom: 8.0),
                              child: Text(
                                  '${searched.category1} > ${searched.subCategory1}',
                                  style: const TextStyle(fontSize: 16)),
                            ),
                          ]),
                          TableRow(children: [
                            const Center(
                                child: Text('カテゴリ2',
                                    style: TextStyle(color: Colors.grey))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 8.0, bottom: 8.0),
                              child: Text(
                                  '${searched.category2} > ${searched.subCategory2}',
                                  style: const TextStyle(fontSize: 16)),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => ref.read(searchProvider),
                        child: const Text('読み込む')),
                    const Text(
                      'firestoreの状態を見る用',
                      style: TextStyle(color: Colors.red),
                    ),
                    DisplayPdf(choiceList: list, documentId: partOfId),
                  ]),
                );
              }
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString())));
  }
}
