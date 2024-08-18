import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class WorkDetailsTable extends StatelessWidget {
  final Searched searched;
  const WorkDetailsTable({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
          inside:
          BorderSide(width: 1, color: Colors.grey)),
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
            child: Text('${searched.course} ／ ${searched.author}',
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
    );
  }
}
