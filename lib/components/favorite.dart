import 'package:flutter/material.dart';

class FavoriteForResultPage extends StatelessWidget {
  final int isFavorite; //todo mySqlから取得
  final int exactLikes; //todo firestoreから取得
  const FavoriteForResultPage(
      {super.key, required this.exactLikes, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isFavorite == 1 ? Colors.red : Colors.white,
      label: SizedBox(
          width: 36,
          height: 30,
          child: Center(
              child: Text(
            exactLikes.toString(),
                style: TextStyle(color: isFavorite == 1 ? Colors.white : Colors.red),
          ))),
      avatar: Icon(
        isFavorite == 1 ? Icons.favorite : Icons.favorite_border,
        size: 25,
        color: isFavorite == 1 ? Colors.white : Colors.red,
      ),
    );
  }
}

class FavoriteForResultListPage extends StatelessWidget {
  final int isFavorite; //todo mySqlから取得
  final int vagueLikes; //todo algoliaから取得
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
