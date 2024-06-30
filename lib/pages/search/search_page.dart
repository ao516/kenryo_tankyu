import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

import '../../constant/constant.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SearchHeader(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('またはカテゴリから選ぶ'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => context.go('/explore'),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.history),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    '検索履歴',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      //todo 検索履歴を削除する処理
                    },
                  ),
                ],
              ),
            ),
            const SearchHistoryList(),
          ],
        ),
      ),
    );
  }
}
