import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/models/notification_content.dart';
import 'package:kenryo_tankyu/pages/pages.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationContent> notifications;
  const NotificationList({super.key,  required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          leading: Icon(notification.type.icon),
          title: Text(notification.title),
            subtitle: Text('${DateTime.now().difference(notification.sendAt).inDays}日前  ${notification.sendAt.month}/${notification.sendAt.day} ${notification.sendAt.hour}:${notification.sendAt.minute.toString().padLeft(2, '0')}'),
          onTap: () {
            //popUpのページに遷移
            showDialog(context: context, builder: (context) {
              return NotificationPopup(notification: testNotificationValue);
            });
          },
        );
      },
    );
  }
}
