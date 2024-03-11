import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Chip(label: Text('22'),avatar: Icon(Icons.favorite));
  }
}
