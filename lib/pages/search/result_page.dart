import 'package:algolia/algolia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultPage extends ConsumerWidget {
  final AlgoliaObjectSnapshot content;
  const ResultPage({super.key, required this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: content.data['year'] % 3 == 0
                      ? Colors.red
                      : content.data['year'] % 3 == 1
                          ? Colors.green
                          : Colors.blue,
                ),
              ),
              Text('${content.data['year'].toString()}年度入学'),
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
              content.data['title'],
              softWrap: true,
              style: const TextStyle(fontSize: 20),
            )),
          ),
          const Favorite(numberOfFavorite: 1000),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Table(
              border: TableBorder.symmetric(
                  inside: const BorderSide(width: 1, color: Colors.grey)),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(5),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  const Center(
                      child: Text('学科 ／ 名前',
                          style: TextStyle(color: Colors.grey))),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, bottom: 8.0),
                    child: Text('${content.data['course']} あと名前',
                        style: const TextStyle(fontSize: 16)),
                  ),
                ]),
                TableRow(children: [
                  const Center(
                      child:
                          Text('カテゴリ1', style: TextStyle(color: Colors.grey))),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, bottom: 8.0),
                    child: Text(
                        '${content.data['category1']} > ${content.data['subCategory1']}',
                        style: const TextStyle(fontSize: 16)),
                  ),
                ]),
                TableRow(children: [
                  const Center(
                      child:
                          Text('カテゴリ2', style: TextStyle(color: Colors.grey))),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8.0, bottom: 8.0),
                    child: Text(
                        '${content.data['category2']} > ${content.data['subCategory2']}',
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
          Consumer(
            builder: (context, ref, child) {
              final searchedAsyncValue =
                  ref.watch(searchedProvider(content.objectID));
              return searchedAsyncValue.when(
                  data: (data) {
                    final partOfId = content.objectID.substring(1);
                    final list = [];
                    if (data.existsSlide!) list.add('スライド');
                    if (data.existsReport!) list.add('レポート');
                    if (data.existsPoster!) list.add('ポスター');
                    if (data.existsThesis!) list.add('論文');

                    ///todo 最初に呼び出すpdfを決定している。ちょっとコード汚いな…。
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      ref.read(stringProvider.notifier).state =
                          list[0] == 'スライド'
                              ? '1$partOfId'
                              : list[0] == 'レポート'
                                  ? '2$partOfId'
                                  : list[0] == 'ポスター'
                                      ? '3$partOfId'
                                      : '4$partOfId';
                    });
                    return Column(
                      children: [
                        Text(data.title),
                        DisplayPdf(choiceList: list, documentId: partOfId),
                      ],
                    );
                  },
                  error: (error, stack) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator());
            },
          ),
        ]),
      ),
    );
  }
}
