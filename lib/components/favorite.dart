import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

//familyを使って、documentIDごとにfavoriteかどうかを記録。
final userIsFavoriteStateProvider = StateNotifierProvider.family
    .autoDispose<ChangeFavoriteStateNotifier, String, String>(
        (ref, documentID) {
  final notifier = ChangeFavoriteStateNotifier(documentID);
  notifier.initialize(ref: ref, documentID: documentID);
  return notifier;
});

class ChangeFavoriteStateNotifier extends StateNotifier<String> {
  ChangeFavoriteStateNotifier(super.initialState);

  Future<void> initialize(
      {required Ref ref, required String documentID}) async {
    final String? favoriteState =
        await HistoryController.instance.getFavoriteState(documentID);
    state = favoriteState ?? '0';
  }

  Future<void> changeUserFavoriteState(
      String documentID, String nowFavoriteState) async {
    final String newFavoriteState = nowFavoriteState == '1' ? '0' : '1';
    await HistoryController.instance
        .changeFavoriteState(documentID, newFavoriteState);
    state = newFavoriteState;
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
    final int exactLikes = searched.exactLikes ?? 0;

    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: isFavorite == '1' ? Colors.red : Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        IconButton(
          icon: Icon(
            isFavorite == '1' ? Icons.favorite : Icons.favorite_border,
            color: isFavorite == '1' ? Colors.red : Colors.black,
          ),
          onPressed: () async {
            if (ableChangeFavorite) {
              ableChangeFavoriteNotifier.state = false; //ボタン連打防止
              ref
                  .read(
                      userIsFavoriteStateProvider(searched.documentID).notifier)
                  .changeUserFavoriteState(searched.documentID, isFavorite);
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
          exactLikes.toString(),
          style: TextStyle(color: isFavorite == '1' ? Colors.red : Colors.black),
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
        isFavorite == '1' ? Icons.favorite : Icons.favorite_border,
        color: isFavorite == '1' ? Colors.red : Colors.black,
      ),
      Text(
        vagueLikes.toString(),
        style: TextStyle(color: isFavorite == '1' ? Colors.red : Colors.black),
      ),
    ]);
  }
}

class FavoriteForHistory extends ConsumerWidget {
  final Searched searched;
  const FavoriteForHistory({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(userIsFavoriteStateProvider(searched.documentID));
    return IconButton(
      icon: isFavorite == '1'
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border,
          color: Colors.red),
      onPressed: () async {
        ref
            .read(
            userIsFavoriteStateProvider(searched.documentID).notifier)
            .changeUserFavoriteState(searched.documentID, isFavorite);
      },
    );
  }
}
