import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SideBar extends ConsumerWidget {
  static final List<String> _items = <String>['2019', '2020', '2021'];
  const SideBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0),
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
                        onPressed: () => ref.read(searchProvider.notifier).deleteParameter(), child: const Text('条件をクリア')), //TODO
                  ],
                ),
                const SizedBox(height: 10.0),
                const SearchDropButton(name: 'カテゴリ', choices: departure),
                const SizedBox(height: 15.0),
                const Text('サブカテゴリを選択',style: TextStyle(fontSize: 16)),
                const SubCategoryChip(),
                const SizedBox(height: 15.0),
                const SearchDropButton(name: '期間', choices: year),
                const SizedBox(height: 15.0),
                const SearchDropButton(name: 'イベント名', choices: eventName),
                const SizedBox(height: 15.0),
                const SearchDropButton(name: '学科指定', choices: departure),
                ElevatedButton(
                    onPressed: () {}, child: const Text('再検索する')), //TODO
              ],
            ),
          ),
        ),
      ),
    );
  }
}
