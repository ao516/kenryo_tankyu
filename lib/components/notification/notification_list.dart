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
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('2024/05/16'),
                    SizedBox(width: 8),
                    Chip(
                        label: Text('システム',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        labelPadding: EdgeInsets.zero,
                        backgroundColor: Colors.red,
                        visualDensity:
                            VisualDensity(horizontal: 0.0, vertical: -4)),
                  ],
                ),
                Text('Title', style: TextStyle(fontSize: 20)),
                Text('subtitle'),
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
