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
    final historyAsyncValue = ref.watch(historyAsyncNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            final notifier = ref.read(historyAsyncNotifierProvider.notifier);
            const history = History(
                title: 'タイトルぅ',
                isFavorite: 1,
                category1: '',
                subCategory1: '',
                category2: '',
                subCategory2: '',
                year: 2012,
                course: '',
                eventName: '',
                author: '');
            await notifier.insertHistory(history);
          },
        ),
      ),
      body: historyAsyncValue.when(
          data: (history) {
            return history == null
                ? const Center(child: Text('No data'))
                : RefreshIndicator(
                    onRefresh: () async {
                      final notifier =
                          ref.read(historyAsyncNotifierProvider.notifier);
                      await notifier.getAllHistory();
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(history[index].title),
                          subtitle: Text(history[index].author),
                          trailing: IconButton(
                            icon: history[index].isFavorite == 1
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border,
                                    color: Colors.red),
                            onPressed: () async {
                              final notifier = ref
                                  .read(historyAsyncNotifierProvider.notifier);
                              await notifier
                                  .changeFavoriteState(history[index]);
                            },
                          ),
                        );
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
