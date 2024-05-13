import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('未実装です'),
          subtitle: Text('to be continued...'),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
