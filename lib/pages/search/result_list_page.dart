import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/algolia/search_algolia.dart';
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
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          FireStoreService().create();
                        },
                        child: const Text('DB')),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(searchedNotifierProvider.notifier).fetchData(ref);
                        },
                        child: const Text('この状態で検索する')),
                    ElevatedButton(
                        onPressed: () {
                          context.push('/result');
                        },
                        child: const Text('結果画面')),
                    IconButton(
                        onPressed: () =>
                            _scaffoldKey.currentState?.openEndDrawer(),
                        icon: const Icon(Icons.tune)),
                  ],
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final asyncValue = ref.watch(searchedNotifierProvider);
                      return asyncValue.when(
                        data: (data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 4.0,bottom: 4.0),
                                child: Text('${data.length}件ヒットしました',style: const TextStyle(fontSize: 16),),
                              ),
                              ResultList(data: data),
                            ],
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stackTrace) {
                          return const Text('エラーが発生しました');
                        },
                      );
                    },
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
}
