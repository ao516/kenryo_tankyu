import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/local_history_db.dart';

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
            final history = History(
              documentID: 111,
                title: '他に作れる？',
                isFavorite: 1,
                category1: '',
                subCategory1: '',
                category2: '',
                subCategory2: '',
                year: 2012,
                course: '',
                eventName: '',
                author: '',
                createdAt: DateTime.now());
            await HistoryController().insertHistory(history);
          },
        ),
      ),
      body: historyAsyncValue.when(
          data: (history) {
            return history == null
                ? const Center(child: Text('No data'))
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
                            subtitle: Text(history[index].author),
                            trailing: IconButton(
                              icon: isFavorite == 1
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_border,
                                      color: Colors.red),
                              onPressed: () {
                                ref
                                    .read(isFavoriteProvider(history[index])
                                        .notifier)
                                    .state = isFavorite == 1 ? 0 : 1;
                                HistoryController().changeFavoriteState(history[index]);
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
