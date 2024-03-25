import 'package:flutter/material.dart';
import '../data/local_history_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryList extends ConsumerWidget {
  final bool onlyFavorite;
  const LibraryList({required this.onlyFavorite, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsyncValue = ref.watch(historyAsyncNotifierProvider);
    return historyAsyncValue.when(
        data: (history) {
          return history == null
              ? const Center(child: Text('No data'))
              : ListView.separated(
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
                        onPressed: () {
                          ref.read(historyAsyncNotifierProvider.notifier);
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
                );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) {
          return Center(child: Text(error.toString()));
        });
  }
}
