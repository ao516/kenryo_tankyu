import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SubCategorySelectPage extends StatelessWidget {
  const SubCategorySelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: ()=> context.push('/resultList'), child: const Text('サブカテゴリ選んでるなう。結果のリスト表示に進む。'),
          ),
        ),
      ),
    );
  }
}
