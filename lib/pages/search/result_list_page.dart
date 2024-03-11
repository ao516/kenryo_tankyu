import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/algolia/search_algolia.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';
import 'package:kenryo_tankyu/data/data.dart';

class ResultListPage extends ConsumerWidget {
  ResultListPage({super.key});

  ///drawerを開くボタンをbody内で使うために、ScaffoldにGlobalKeyを指定して、Scaffoldの状態を保持しているScaffoldStateを参照できるようにします。
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///書き換えるときに使うところ
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async => context.pop(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const ResultHeader(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('〇件ヒットしました'),
                    IconButton(
                        onPressed: () =>
                            _scaffoldKey.currentState?.openEndDrawer(),
                        icon: const Icon(Icons.tune)),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                FireStoreService().create();
                              },
                              child: const Text('DB追加')),
                          ElevatedButton(
                              onPressed: () {
                                ref.read(searchedNotifierProvider.notifier).fetchData(ref);
                              },
                              child: const Text('現在の状態で検索する')),
                        ],
                      ),
                      const ResultList(),
                      Consumer(
                        builder: (context, ref, child) {
                          final asyncValue = ref.watch(searchedNotifierProvider);
                          return asyncValue.when(
                            data: (data) {
                              return Text(data);
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (error, stackTrace) {
                              return const Text('エラーが発生しました');
                            },
                          );
                        },
                      ),

                      //読み込んだデータをテキストにして表示する

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        endDrawer: const SideBar(),
      ),
    );
  }

  Future<DocumentSnapshot> fetchData() {
    return FirebaseFirestore.instance
        .collection('works')
        .doc('document1')
        .get();
  }
}
