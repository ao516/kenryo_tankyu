import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
  final int numberOfFavorite;
  const Favorite({super.key,required this.numberOfFavorite});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(numberOfFavorite.toString()),avatar: const Icon(Icons.favorite));
  }
}
