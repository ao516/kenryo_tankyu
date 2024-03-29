import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

class FavoriteForResultPage extends ConsumerWidget {
  final Searched searched;

  const FavoriteForResultPage(
      {super.key, required this.searched});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isFavorite =
    ref.watch(isFavoriteProvider(searched));
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
          onPressed: () async{
            ref
                .read(isFavoriteProvider(searched).notifier)
                .state = isFavorite == 1 ? 0 : 1; //画面の表示の管理
            await HistoryController.instance.changeFavoriteState(
                searched.documentID, isFavorite == 1 ? 0 : 1); //SQLiteの変更
            await FireStoreService.instance.saveFavoriteData(searched: searched); //Firestoreの変更
          },
        ),
        const SizedBox(height: 4),
        Text(
          isFavorite  == 1? (searched.exactLikes!  + 1).toString() : searched.exactLikes.toString(), //TODO　ここだけ!いれてるのやばい。。笑
          style: TextStyle(color:  isFavorite == 1 ? Colors.red : Colors.black),
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
