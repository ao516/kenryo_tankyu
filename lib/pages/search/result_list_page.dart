import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/service/algolia_provider.dart';
import 'package:kenryo_tankyu/service/service.dart';

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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            FireStoreService().create();
                          },
                          child: const Text('DB')),
                      ElevatedButton(
                          onPressed: () {
                            ref.read(algoliaNotifierProvider.notifier).fetchData(ref);
                          },
                          child: const Text('この状態で検索する')),
                      IconButton(
                          onPressed: () {}, //todo ソート処理を書く いいね数順、古い順、新しい順
                          icon: const Icon(Icons.sort)),
                      IconButton(
                          onPressed: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
                          icon: const Icon(Icons.tune)),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final asyncValue = ref.watch(algoliaNotifierProvider);
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
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, stackTrace) {
                          return Center(
                            child: Column(
                              children: [
                                const Text('エラーが発生しました'),
                                Text(error.toString()),
                              ],
                            ),
                          );
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
