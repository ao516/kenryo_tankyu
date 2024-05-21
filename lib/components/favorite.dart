import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

///documentIDごとにfavoriteかどうかを記録するProvider。
final userIsFavoriteStateProvider = StateNotifierProvider.family
    .autoDispose<ChangeFavoriteStateNotifier, int, String>((ref, documentID) {
  final notifier = ChangeFavoriteStateNotifier(0);
  notifier.initialize(documentID: documentID);
  return notifier;
});

class ChangeFavoriteStateNotifier extends StateNotifier<int> {
  ChangeFavoriteStateNotifier(super.initialState);

  Future<void> initialize({required String documentID}) async {
    final int? favoriteState =
        await HistoryController.instance.getFavoriteState(documentID);
    state = favoriteState ?? 0;
  }

  Future<void> changeUserFavoriteState(
      String documentID, int nowFavoriteState) async {
    final int newFavoriteState = nowFavoriteState == 1 ? 0 : 1;
    await HistoryController.instance
        .changeFavoriteState(documentID, newFavoriteState);
    state = newFavoriteState;
  }
}

///documentIDごとにFavoriteの数を管理するProvider
final favoriteCountProvider = StateNotifierProvider.family
    .autoDispose<ChangeFavoriteCountNotifier, int, Searched>((ref, searched) {
  return ChangeFavoriteCountNotifier(searched.exactLikes ?? 0);
});

class ChangeFavoriteCountNotifier extends StateNotifier<int> {
  ChangeFavoriteCountNotifier(super.initialState);

  Future<void> changeFavoriteCount({
    required Searched searched,
    required int nowIsFavorite,
    required bool needToChangeAlgoliaValue,
  }) async {
    final int beforeIsFavorite = searched.isFavorite;
    final int beforeExactLikes = searched.exactLikes ?? 0;

    //beforeIsFavoriteは、データを表示させた時点でのユーザーがお気に入り状態だったかどうか。
    //        →Algoliaからリスト取得した際にローカルDBを参照したときにsearchedに一緒に組み込んであるためそこから取得。
    //nowIsFavoriteは、現在のユーザーのお気に入り状態かどうかを取得。  →userIsFavoriteStateProvider(family:documentID)で取得。
    //beforeExactLikesは、データを表示させた時点でのお気に入り数。  →画面を開いたときのfirestoreからのデータで取得。
    //この３つの値から、いいねボタンを押したときの数値の変動を計算できる。



    final int nextFavoriteValue = nowIsFavorite == beforeIsFavorite
        ? nowIsFavorite == 1
            ? beforeExactLikes - 1
            : beforeExactLikes + 1
        : beforeExactLikes;
    //ここ頭使ってるよー、合ってるかな。

    debugPrint('beforeIsFavorite: $beforeIsFavorite\n'
        'nowIsFavorite: $nowIsFavorite\n'
        'beforeExactLikes: $beforeExactLikes\n'
        'nextFavoriteValue: $nextFavoriteValue\n');

    //algoliaの変更を計
    int nextAlgoliaFavoriteValue = 0;
    if (nextFavoriteValue <= 5 || nextFavoriteValue % 5 == 0) {
      nextAlgoliaFavoriteValue = nextFavoriteValue;
    }
    final firestore =
        FirebaseFirestore.instance.collection('works').doc(searched.documentID);
    if (nextAlgoliaFavoriteValue != -10 && needToChangeAlgoliaValue) {
      await firestore.update({
        'exactLikes': nextFavoriteValue,
        'vagueLikes': nextAlgoliaFavoriteValue
      });
    } else {
      await firestore.update({'exactLikes': nextFavoriteValue});
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
        border: Border.all(color: isFavorite == 1 ? Colors.red : Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        IconButton(
          icon: Icon(
            isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
            color: isFavorite == 1 ? Colors.red : Colors.black,
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
                needToChangeAlgoliaValue: true,
                    searched: searched,
                    nowIsFavorite: isFavorite,
                  );
              await Future.delayed(const Duration(seconds: 2));
              ableChangeFavoriteNotifier.state = true; //ボタン連打防止
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
          style: TextStyle(color: isFavorite == 1 ? Colors.red : Colors.black),
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
    final int vagueLikes = searched.vagueLikes ?? 0;

    return Column(children: [
      Icon(
        isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
        color: isFavorite == 1 ? Colors.red : Colors.black,
      ),
      Text(
        vagueLikes.toString(),
        style: TextStyle(color: isFavorite == 1 ? Colors.red : Colors.black),
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
      },
    );
  }
}
