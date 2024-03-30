import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

///ボタン連打防止を管理するProvider
final ableChangeFavoriteProvider =
    StateProvider.autoDispose<bool>((ref) => true);

class FavoriteForResultPage extends ConsumerWidget {
  final Searched searched;

  const FavoriteForResultPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ableChangeFavorite = ref.watch(ableChangeFavoriteProvider);
    final ableChangeFavoriteNotifier =
        ref.read(ableChangeFavoriteProvider.notifier);
    final isFavorite = ref.watch(isFavoriteProvider(searched));
    final isFavoriteNotifier = ref.read(isFavoriteProvider(searched).notifier);

    final int nowFavoriteValue = searched.exactLikes ?? 0;
    final int nextFavoriteValue =
        searched.isFavorite == 1 ? nowFavoriteValue - 1 : nowFavoriteValue + 1;

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
            debugPrint('押されました。');
            if (ableChangeFavorite) {
              ableChangeFavoriteNotifier.state = false; //ボタン連打防止
              isFavoriteNotifier.state = isFavorite == 1 ? 0 : 1; //画面の変更
              await HistoryController.instance.changeFavoriteState(
                  searched.documentID, isFavorite == 1 ? 0 : 1); //SQLiteの変更
              await FireStoreService.instance.saveFavoriteData(
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
          isFavorite == 1
              ? nextFavoriteValue.toString()
              : nowFavoriteValue.toString(),
          style: TextStyle(color: isFavorite == 1 ? Colors.red : Colors.black),
        ),
      ]),
    );
  }
}

class FavoriteForResultListPage extends StatelessWidget {
  final int isFavorite;
  final int vagueLikes;
  const FavoriteForResultListPage(
      {super.key, required this.isFavorite, required this.vagueLikes});

  @override
  Widget build(BuildContext context) {
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
