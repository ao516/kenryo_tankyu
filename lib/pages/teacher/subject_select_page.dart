
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubjectSelectPage extends ConsumerWidget {
  const SubjectSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ['国語', '数学', '理科', '社会', '英語', '実技', '教務'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('縣陵先生図鑑'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => context.push('/teacher/search'),
            ),
          ],
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
              onTap: () => context.push('/teacher/select', extra: index),
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
