import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
              value: true,
              onChanged: (bool value) async {
                final fcm = FirebaseMessaging.instance;
                if (value) {
                  await fcm.requestPermission();
                } else {
                  await fcm.requestPermission();
                }
              },
              secondary: const Icon(Icons.notifications_active_outlined),
              title: const Text('通知を受け取る')),
          ListTile(
            title: const Text('ログアウト'),
            leading: const Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
