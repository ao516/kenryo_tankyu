import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/test/tests.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('お知らせ'),actions: [
        IconButton(
          icon: const Icon(Icons.mark_email_read),
          onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('全て既読にしますか？'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO 既読にする処理
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
          },
        ),
      ],),
      body: NotificationList(notifications: [testNotificationValue]),
    );
  }
}
