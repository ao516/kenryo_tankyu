import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/pages/pages.dart';

class NotificationList extends StatelessWidget {
  final int displayCount;
  const NotificationList({super.key, required this.displayCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: displayCount,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top:4.0,bottom: 8.0),
            child: Row(
              children: [
                const Icon(Icons.notifications_active_outlined),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title', style: Theme.of(context).textTheme.bodyLarge),
                    Text('subtitle', style: Theme.of(context).textTheme.bodyMedium),
                    Text('2021/01/01 12:34', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            //popUpのページに遷移
            showDialog(context: context, builder: (context) {
              return NotificationPopup(notification: testValue);
            });
          },
        );
      },
    );
  }
}
