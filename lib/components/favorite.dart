import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';

import '../db/db.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

///documentIDごとにfavoriteかどうかを記録するProvider。
final userIsFavoriteStateProvider = StateNotifierProvider.family
    .autoDispose<ChangeFavoriteStateNotifier, int, int>((ref, documentID) {
  final notifier = ChangeFavoriteStateNotifier(0);
  notifier.initialize(documentID: documentID);
  return notifier;
});

class ChangeFavoriteStateNotifier extends StateNotifier<int> {
  ChangeFavoriteStateNotifier(super.initialState);

  Future<void> initialize({required int documentID}) async {
    final int? favoriteState =
        await SearchedHistoryController.instance.getFavoriteState(documentID);
    state = favoriteState ?? 0;
  }

  Future<void> changeUserFavoriteState(
      int documentID, int nowFavoriteState) async {
    final int newFavoriteState = nowFavoriteState == 1 ? 0 : 1;
    await SearchedHistoryController.instance
        .changeFavoriteState(documentID, newFavoriteState);
    state = newFavoriteState;
  }
}

///documentIDごとにFavoriteの数を管理するProvider
final favoriteCountProvider =
    StateNotifierProvider.family<ChangeFavoriteCountNotifier, int, Searched>(
        (ref, searched) {
  return ChangeFavoriteCountNotifier(searched.exactLikes);
});

class ChangeFavoriteCountNotifier extends StateNotifier<int> {
  ChangeFavoriteCountNotifier(super.initialState);

  Future<void> changeFavoriteCount({
    required Searched searched,
    required int nowIsFavorite,
  }) async {
    final int beforeIsFavorite = searched.isFavorite;
    final int beforeExactLikes = searched.exactLikes;
    // 新しいお気に入りの数を計算
        final int nextFavoriteValue = nowIsFavorite == beforeIsFavorite
        ? nowIsFavorite == 1
            ? beforeExactLikes - 1
            : beforeExactLikes + 1
        : beforeExactLikes;
    //ここ頭使ってるよー、合ってるかな。
    
    //TODO Algoliaのデータを更新するかどうかの判定。今は入れてないけど、将来的にコスト削減のために入れるかもしれない。
    //final bool needToChangeAlgolia = nextFavoriteValue < 5 || nextFavoriteValue % 5 == 0;

    // Firestoreのlikeの値を更新
    final firestore = FirebaseFirestore.instance
        .collection('works')
        .doc(searched.documentID.toString());
    if (nowIsFavorite == 1) {
      await firestore.update({'exactLikes': FieldValue.increment(-1),'vagueLikes': FieldValue.increment(-1)});
    } else {
      await firestore.update({'exactLikes': FieldValue.increment(1),'vagueLikes': FieldValue.increment(1)});
    }

    state = nextFavoriteValue;
  }
}

///ResultPageのFavoriteボタン。(Widget)
class FavoriteForResultPage extends ConsumerWidget {
  final Searched searched;
  const FavoriteForResultPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ableChangeFavorite = ref.watch(ableChangeFavoriteProvider);
    final ableChangeFavoriteNotifier =
        ref.read(ableChangeFavoriteProvider.notifier);
    final isFavorite =
        ref.watch(userIsFavoriteStateProvider(searched.documentID));
    final int likes = ref.watch(favoriteCountProvider(searched));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isFavorite == 1
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        IconButton(
          icon: Icon(
            isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
            color: isFavorite == 1
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () async {
            if (ableChangeFavorite) {
              ableChangeFavoriteNotifier.state = false; //ボタン連打防止
              ref
                  .read(
                      userIsFavoriteStateProvider(searched.documentID).notifier)
                  .changeUserFavoriteState(searched.documentID, isFavorite);
              ref
                  .read(favoriteCountProvider(searched).notifier)
                  .changeFavoriteCount(
                    searched: searched,
                    nowIsFavorite: isFavorite,
                  );
              await Future.delayed(const Duration(seconds: 2));
              if (context.mounted) {
                ableChangeFavoriteNotifier.state = true; //ボタン連打防止
              }
            } else {
              const snackBar = SnackBar(
                  content: Text('データ保存中です。'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
        const SizedBox(height: 4),
        Text(
          likes.toString(),
          style: TextStyle(
              color: isFavorite == 1
                  ? Colors.red
                  : Theme.of(context).colorScheme.onSurface),
        ),
      ]),
    );
  }
}

class FavoriteForResultListPage extends ConsumerWidget {
  final Searched searched;
  const FavoriteForResultListPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite =
        ref.watch(userIsFavoriteStateProvider(searched.documentID));
    final int likes = ref.watch(favoriteCountProvider(searched));

    return Column(children: [
      Icon(
        isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
        color: isFavorite == 1
            ? Colors.red
            : Theme.of(context).colorScheme.onSurface,
      ),
      Text(
        likes.toString(),
        style: TextStyle(
            color: isFavorite == 1
                ? Colors.red
                : Theme.of(context).colorScheme.onSurface),
      ),
    ]);
  }
}

class FavoriteForHistory extends ConsumerWidget {
  final Searched searched;
  const FavoriteForHistory({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite =
        ref.watch(userIsFavoriteStateProvider(searched.documentID));
    return IconButton(
      icon: isFavorite == 1
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border, color: Colors.red),
      onPressed: () async {
        ref
            .read(userIsFavoriteStateProvider(searched.documentID).notifier)
            .changeUserFavoriteState(searched.documentID, isFavorite);
        ref.read(favoriteCountProvider(searched).notifier).changeFavoriteCount(
              searched: searched,
              nowIsFavorite: isFavorite,
            );
      },
    );
  }
}
