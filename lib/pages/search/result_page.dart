import 'package:algolia/algolia.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/components.dart';

class ResultPage extends StatelessWidget {
  final AlgoliaObjectSnapshot content;
  ResultPage({super.key, required this.content});

  final List<String> _choiceList = ['スライド', 'レポート', '論文'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            //TODO: シェア機能実装、できれば。
            debugPrint('未実装');
          },
          icon: const Icon(Icons.share),
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

      ],),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
        child: Column(children: [
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
                child: Text(content.data['title'],
                  softWrap: true,
                  style: const TextStyle(fontSize: 20),
                )),
          ),
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
                    padding: const EdgeInsets.only(left: 16.0 ,top: 8.0, bottom: 8.0),
                    child: Text('${content.data['course']} あと名前', style: const TextStyle(fontSize: 16)),
                  ),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('カテゴリ1',
                          style: TextStyle(color: Colors.grey))),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0 ,top: 8.0, bottom: 8.0),
                    child: Text('${content.data['category1']} > ${content.data['subCategory1']}', style: const TextStyle(fontSize: 16)),
                  ),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('カテゴリ2',
                          style: TextStyle(color: Colors.grey))),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0 ,top: 8.0, bottom: 8.0),
                    child: Text('${content.data['category2']} > ${content.data['subCategory2']}', style: const TextStyle(fontSize: 16)),
                  ),
                ]),
              ],
            ),
          ),
          const DisplayPdf(),


        ]),
      ),
    );
  }
}



