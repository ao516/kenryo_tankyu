import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: ElevatedButton(onPressed: ()=> context.push('/subCategory'), child: const Text('カテゴリを選ぶ')),
      )),
    );
  }
}
