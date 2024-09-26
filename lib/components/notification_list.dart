import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return GestureDetector(
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
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Title'),
                  content: const Text('これから作っていくよ！'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
