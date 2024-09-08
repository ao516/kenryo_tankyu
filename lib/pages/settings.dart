import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/service.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationSetting = ref.watch(notificationSettingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: Column(
        children: [
          SwitchListTile(
              value: notificationSetting,
              onChanged: (bool value) async {
                if (!value) {
                  final fcm = FirebaseMessaging.instance;
                  final token = await fcm.getToken();
                  debugPrint(token);
                }
                ref.read(notificationSettingProvider.notifier).toggle();
              },
              secondary: const Icon(Icons.notifications_active_outlined),
              title: const Text('通知を受け取る')),
          ListTile(
              title: const Text('ログアウト'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text('ログアウトしてよろしいですか？'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('いいえ'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                              },
                              child: const Text('はい'),
                            ),
                          ]);
                    });
              }),
          ListTile(
            title: const Text('テーマ設定'),
            leading: const Icon(Icons.light_mode),
            trailing: DropdownButton<ThemeMode>(
              value: ref.watch(themeModeProvider),
              onChanged: (ThemeMode? value) {
                _saveThemeMode(value!);
                ref.read(themeModeProvider.notifier).state = value;
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('システムの設定'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('ライト'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('ダーク'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveThemeMode(ThemeMode themeMode) {
    ThemePreferences().saveThemeMode(themeMode);
  }
}
