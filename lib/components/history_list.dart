import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../service/searched_history_db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryList extends ConsumerWidget {
  final bool onlyFavorite;
  const LibraryList({required this.onlyFavorite, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String str = onlyFavorite ? 'お気に入りに登録された作品は' : '履歴は';
    final historyAsyncValue = ref.watch(historyProvider(onlyFavorite));
    return historyAsyncValue.when(
        data: (searcheds) {
          return searcheds == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$strありません。'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => ref.invalidate(historyProvider),
                        child: const Text('リロードする')),
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(historyProvider);
                  },
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: searcheds.length,
                    itemBuilder: (context, index) {
                      return Consumer(builder: (context, ref, child) {
                        final searched = searcheds[index];
                        final isFavorite =
                            ref.watch(isFavoriteProvider(searched));

                        ///この辺のいいねの管理はどうやってんの？って感じだと思うから補足しておく。
                        ///まずはhistoryProvider（futureProvider）で全部のデータベースを取得する。RefreshIndicatorでもやっていることは同様
                        ///そのあと、入ってきたお気に入りのデータを一旦、isFavoriteProviderに保守させる。
                        ///画面の変更はこのproviderの変更によって成されており、DBの変更は裏で行われているため画面には反映されていない。
                        ///このような挙動を採用した理由は、1つのfutureProviderで行ったときにお気に入りの登録でDBに変更が出た場合、
                        ///もう１度全てのデータベースを読み取ることになってすべての画面を書き直すことになってしまうから。

                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(searched.title),
                              Text('id => ${searched.documentID}'),
                              Text('今isFavorite => ${searched.isFavorite}'),
                            ],
                          ),
                          subtitle: Text(searched.savedAt.toString()),
                          trailing: IconButton(
                            icon: isFavorite == 1
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border,
                                    color: Colors.red),
                            onPressed: () async {
                              ref
                                  .read(isFavoriteProvider(searched).notifier)
                                  .state = isFavorite == 1 ? 0 : 1;
                              await HistoryController.instance.changeFavoriteState(
                                  searched.documentID, isFavorite == 1 ? 0 : 1);
                            },
                          ),
                          onTap: () => context.push('/result',extra: searched),
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
