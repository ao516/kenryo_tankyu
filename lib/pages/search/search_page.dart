import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchHeader(),
      body: SafeArea(child: Center(
          child: ElevatedButton(onPressed: ()=> context.go('/explore'), child: const Text('またはカテゴリから選ぶ'),
    ),
    ),),
    );
  }
}
