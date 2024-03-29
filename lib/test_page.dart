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
        title: Text('test'),
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Text('test')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(historyProvider);
        },
        child: const Icon(Icons.add),
      )
    );
  }
}
