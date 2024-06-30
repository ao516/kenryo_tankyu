import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/components/favorite.dart';
import '../service/searched_history_db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryList extends ConsumerWidget {
  final bool onlyFavorite;
  const LibraryList({required this.onlyFavorite, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String str = onlyFavorite ? 'お気に入りに登録された作品は' : '履歴は';
    final historyAsyncValue = ref.watch(searchedHistoryProvider(onlyFavorite));
    return historyAsyncValue.when(
        data: (searcheds) {
          return searcheds == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$strありません。'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => ref.invalidate(searchedHistoryProvider),
                        child: const Text('リロードする')),
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(searchedHistoryProvider);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: searcheds.length,
                      itemBuilder: (context, index) {
                        return Consumer(builder: (context, ref, child) {
                          final searched = searcheds[index];
                          return HistoryPreviewContent(searched: searched);
                        });
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(),
                        );
                      },
                    ),
                  ),
                );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) {
          return Center(child: Text(error.toString()));
        });
  }
}
