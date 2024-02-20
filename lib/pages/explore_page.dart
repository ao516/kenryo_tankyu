import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryList(),
    );
  }
}
