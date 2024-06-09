import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultPageRoute extends ConsumerWidget {
  final Searched beforeSearched;
  const ResultPageRoute({super.key, required this.beforeSearched});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searched = ref.watch(getFirestoreSearchedProvider(beforeSearched));
    return Scaffold(
      body: searched.when(
        data: (searched) {
          if (searched == null) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: Text('データを取得できませんでした。')),
            );
          } else {
            return ResultPageMain(searched: searched);
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Scaffold(
          appBar: AppBar(),
          body: Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
