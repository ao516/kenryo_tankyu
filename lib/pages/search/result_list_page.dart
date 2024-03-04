import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class ResultListPage extends ConsumerWidget {
  ResultListPage({super.key});

  ///drawerを開くボタンをbody内で使うために、ScaffoldにGlobalKeyを指定して、Scaffoldの状態を保持しているScaffoldStateを参照できるようにします。
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    SearchNotifier searchNotifier = ref.read(searchProvider.notifier);

    ///書き換えるときに使うところ

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async => context.pop(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const ResultHeader(),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('〇件ヒットしました'),
                  IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                      icon: const Icon(Icons.tune)),
                ],
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => context.push('/result'),
                    child: const Text('結果リストなう。結果表示に進む。'),
                  ),
                ),
              ),
            ],
          ),
        ),
        endDrawer: const SideBar(),
      ),
    );
  }
}
