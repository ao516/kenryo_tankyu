import 'package:flutter/material.dart';
import '../data/local_history_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryList extends ConsumerWidget {
  final bool onlyFavorite;
  const LibraryList({required this.onlyFavorite, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final  String str = onlyFavorite ? 'お気に入りに登録された作品は' : '履歴は';
    final historyAsyncValue = ref.watch(historyProvider(onlyFavorite));
    return historyAsyncValue.when(
        data: (history) {
          return history == null
              ?  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$strありません。'),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: () => ref.invalidate(historyProvider), child: const Text('リロードする')),
                ],
              )
              : RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(historyProvider);
                  },
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      return Consumer(builder: (context, ref, child) {
                        final isFavorite =
                            ref.watch(isFavoriteProvider(history[index]));

                        ///この辺のいいねの管理はどうやってんの？って感じだと思うから補足しておく。
                        ///まずはhistoryProvider（futureProvider）で全部のデータベースを取得する。RefreshIndicatorでもやっていることは同様
                        ///そのあと、入ってきたお気に入りのデータを一旦、isFavoriteProviderに保守させる。
                        ///画面の変更はこのproviderの変更によって成されており、DBの変更は裏で行われているため画面には反映されていない。
                        ///このような挙動を採用した理由は、1つのfutureProviderで行ったとき、お気に入りの登録でDBに変更が出た場合、もう１度全てのデータベースを読み取ることになるから。
                        return ListTile(
                          title: Text(history[index].title),
                          subtitle: Text(history[index].createdAt.toString()),
                          trailing: IconButton(
                            icon: isFavorite == 1
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border,
                                    color: Colors.red),
                            onPressed: () {
                              ref
                                  .read(isFavoriteProvider(history[index])
                                      .notifier)
                                  .state = isFavorite == 1 ? 0 : 1;
                              HistoryController()
                                  .changeFavoriteState(history[index]);
                            },
                          ),
                        );
                      });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      );
                    },
                  ),
              );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) {
          return Center(child: Text(error.toString()));
        });
  }
}
