import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/searched_history_db_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ['国語', '数学', '理科', '社会', '英語', '実技', '教務'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('縣陵先生図鑑'),
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                height: 5,
                color: Colors.grey,
              ),
            );
          },
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => context.go('/test/teacherList', extra: index),
              title: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/subject_image/Japanese.png',
                  ),
                  Text(items[index]),
                ],
              ),
            );
          },
        ));
  }
}
