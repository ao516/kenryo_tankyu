import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

///updateFavoriteStateとchangeFavoriteStateProviderを使用して、お気に入りの状態を変更、保守している。
void updateFavoriteState(Searched searched, WidgetRef ref) {
  final updatedSearchedNotifier =
      ref.read(changeFavoriteStateProvider(searched).notifier);
  final int isFavorite = searched.isFavorite;
  final int nextFavorite = searched.isFavorite == 1 ? 0 : 1;
  final int nowFavoriteValue = searched.exactLikes ?? 0;
  final int nextFavoriteValue =
      isFavorite == 1 ? nowFavoriteValue - 1 : nowFavoriteValue + 1;
  final updatedSearched = searched.copyWith(
    isFavorite: nextFavorite,
    exactLikes: nextFavoriteValue,
  );
  debugPrint('更新後→state=>$nextFavorite,数値=>$nextFavoriteValue');
  updatedSearchedNotifier.state = updatedSearched;
}
final changeFavoriteStateProvider = StateProvider.autoDispose
    .family<Searched, Searched>((ref, searched) => searched);

class FavoriteForResultPage extends ConsumerWidget {
  final Searched searched;
  const FavoriteForResultPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ableChangeFavorite = ref.watch(ableChangeFavoriteProvider);
    final ableChangeFavoriteNotifier =
        ref.read(ableChangeFavoriteProvider.notifier);
    final updatedSearched = ref.watch(changeFavoriteStateProvider(searched));
    final int isFavorite = updatedSearched.isFavorite;
    final int exactLikes = updatedSearched.exactLikes!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: updatedSearched.isFavorite == 1 ? Colors.red : Colors.black),
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
              updateFavoriteState(updatedSearched, ref);
              await HistoryController.instance.changeFavoriteState(
                  searched.documentID, isFavorite == 1 ? 0 : 1); //SQLiteの変更
              await FireStoreService.instance.saveFavoriteData(
                  nowFavoriteValue: exactLikes,
                  searched: searched,
                  isFavorite: isFavorite,
                  needToChangeAlgoliaValue: true); //Firestoreの変更
              await Future.delayed(const Duration(seconds: 2));
              ableChangeFavoriteNotifier.state = true; //ボタン連打防止
            } else {
              debugPrint('ボタン連打防止のため、保存できません。');
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
    final updatedSearched = ref.watch(changeFavoriteStateProvider(searched));
    final int isFavorite = updatedSearched.isFavorite;
    final int vagueLikes = updatedSearched.vagueLikes!;

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
