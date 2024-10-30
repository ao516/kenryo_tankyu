import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/db/search_history_db.dart';
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
              : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final Search search = searches[index];
                  final String word = _connectWord(search);
                  return ListTile(
                      trailing: const Icon(Icons.navigate_next),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(word,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                          ),
                          Text(' ${search.numberOfHits}件',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      onTap: () {
                        ref
                            .read(searchProvider.notifier)
                            .setParameters(search);
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
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) {
          debugPrint('error: $error');
          return Center(child: Text(error.toString()));
        });
  }

  String _connectWord(Search search) {
    final List<String> searchList = [];
    //searchList.addAll(search.searchWord!);
    searchList.add(search.category.displayName);
    searchList.add(search.subCategory.displayName);
    searchList.add(search.enterYear.displayName.toString());
    searchList.add(search.eventName.displayName);
    searchList.add(search.course.displayName);
    return searchList.join(', ');
  }
}
