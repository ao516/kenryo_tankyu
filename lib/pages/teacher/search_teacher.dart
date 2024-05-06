import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../components/components.dart';

class SearchTeacher extends StatelessWidget {
  const SearchTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchHeader(),
      body: Text('検索結果を表示'),

    );
  }
}
