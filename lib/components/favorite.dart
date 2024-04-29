import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

final changeFavoriteStateProvider = StateNotifierProvider.family
    .autoDispose<ChangeFavoriteStateNotifier, Searched, String>(
        (ref, value) => ChangeFavoriteStateNotifier(value));

class ChangeFavoriteStateNotifier extends StateNotifier<Searched> {
  ChangeFavoriteStateNotifier(String documentID)
      : super(const Searched(
            documentID: '11',
            isFavorite: 1,
            category1: '',
            category2: '',
            subCategory1: '',
            subCategory2: '',
            year: 0,
            eventName: '',
            course: '',
            title: ''));

  void updateFavoriteState(Searched searched) {

    final int isFavorite = searched.isFavorite;
    final int nextFavorite = searched.isFavorite == 1 ? 0 : 1;
    final int nowFavoriteValue = searched.exactLikes ?? 0;
    final int nextFavoriteValue =
        isFavorite == 1 ? nowFavoriteValue - 1 : nowFavoriteValue + 1;
    final updatedSearched = searched.copyWith(
      isFavorite: nextFavorite,
      exactLikes: nextFavoriteValue,
    );
    // debugPrint('更新前\n$searched,\n\n更新後\n$updatedSearched');
    state = updatedSearched;
  }
}

class FavoriteForResultPage extends ConsumerWidget {
  final Searched searched;
  const FavoriteForResultPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ableChangeFavorite = ref.watch(ableChangeFavoriteProvider);
    final ableChangeFavoriteNotifier =
        ref.read(ableChangeFavoriteProvider.notifier);
    final updatedSearched =
        ref.watch(changeFavoriteStateProvider(searched.documentID));
    final int isFavorite = updatedSearched.isFavorite;
    final int exactLikes = updatedSearched.exactLikes ?? 0;

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
              ref
                  .read(
                      changeFavoriteStateProvider(searched.documentID).notifier)
                  .updateFavoriteState(searched);
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
    final updatedSearched =
        ref.watch(changeFavoriteStateProvider(searched.documentID));
    final int isFavorite = updatedSearched.isFavorite;
    final int vagueLikes = updatedSearched.vagueLikes?? 0;

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
