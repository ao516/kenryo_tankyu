import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final bool isFavorite = false; //todo 将来的にはmySqlから取得する？firestoreから取得する？
  final int numberOfFavorite;
  const Favorite({super.key, required this.numberOfFavorite});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isFavorite ? Colors.red : Colors.white,
      label: SizedBox(
          width: 36,
          height: 30,
          child: Center(
              child: Text(
            isFavorite
                ? (numberOfFavorite + 1).toString()
                : numberOfFavorite.toString(),
            style: TextStyle(color: isFavorite ? Colors.white : Colors.black),
          ))),
      avatar: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 25,
        color: isFavorite ? Colors.white : Colors.red,
      ),
    );
  }
}
