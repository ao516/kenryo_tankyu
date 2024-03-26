import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsyncValue = ref.watch(historyProvider(false));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            final searched = Searched(
              documentID: '10000',
              title: '履歴だよー',
              isFavorite: 1,
              category1: '',
              subCategory1: '',
              category2: '',
              subCategory2: '',
              year: 2012,
              course: '',
              eventName: '',
              savedAt: DateTime.now(),
            );
            await HistoryController.instance.insertHistory(searched);
          },
        ),
      ),
      body: historyAsyncValue.when(
          data: (searched) {
            return searched == null
                ? Center(child: Column(
                  children: [
                    const Text('データがヒットしませんでした'),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: ()=> ref.invalidate(historyProvider), child: const Text('リロードする')),
                  ],
                ))
                : RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(historyProvider);
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: searched.length,
                      itemBuilder: (context, index) {
                        return Consumer(builder: (context, ref, child) {
                          final isFavorite =
                              ref.watch(isFavoriteProvider(searched[index]));

                          ///この辺のいいねの管理はどうやってんの？って感じだと思うから補足しておく。
                          ///まずはhistoryProvider（futureProvider）で全部のデータベースを取得する。RefreshIndicatorでもやっていることは同様
                          ///そのあと、入ってきたお気に入りのデータを一旦、isFavoriteProviderに保守させる。
                          ///画面の変更はこのproviderの変更によって成されており、DBの変更は裏で行われているため画面には反映されていない。
                          ///このような挙動を採用した理由は、1つのfutureProviderで行ったとき、お気に入りの登録でDBに変更が出た場合、もう１度全てのデータベースを読み取ることになるから。
                          return ListTile(
                            title: Column(
                              children: [
                                Text(searched[index].title),
                                Text(searched[index].documentID),
                              ],
                            ),
                            subtitle: Text(searched[index].savedAt.toString()),
                            trailing: IconButton(
                              icon: isFavorite == 1
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_border,
                                      color: Colors.red),
                              onPressed: () {
                                ref
                                    .read(isFavoriteProvider(searched[index])
                                        .notifier)
                                    .state = isFavorite == 1 ? 0 : 1;
                                HistoryController.instance.changeFavoriteState(
                                    searched[index].documentID,
                                    isFavorite == 1 ? 0 : 1);
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
          }),
    );
  }
}
