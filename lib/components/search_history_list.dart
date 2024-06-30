import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/service/search_history_db_provider.dart';

import '../constant/constant.dart';
import '../providers/providers.dart';

class SearchHistoryList extends ConsumerWidget {
  const SearchHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsyncValue = ref.watch(searchHistoryProvider);
    return historyAsyncValue.when(
        data: (searches) {
          return searches == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('検索履歴はありません。'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => ref.invalidate(searchHistoryProvider),
                        child: const Text('リロードする')),
                  ],
                )
              : Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      final search = searches[index];
                      return ListTile(
                          trailing: const Icon(Icons.navigate_next),
                          title: Text(search.searchWord.toString()),
                          onTap: () {
                            ref
                                .read(searchProvider.notifier)
                                .addKeyWord(searchHistoryList[index]); //todo 変更
                            context.pushReplacement('/resultList');
                          });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                    itemCount: searches.length,
                  ),
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) {
          return Center(child: Text(error.toString()));
        });
  }
}
