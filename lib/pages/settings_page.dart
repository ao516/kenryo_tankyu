import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../db/db.dart';

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
                if (value) {
                  final fcm = FirebaseMessaging.instance;
                  final token = await fcm.getToken();
                  debugPrint(token);
                }
                ref.read(notificationSettingProvider.notifier).toggle();
              },
              secondary: const Icon(Icons.notifications_active_outlined),
              title: const Text('通知を受け取る')),
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
          ListTile(
            title: const Text('アプリの情報'),
            leading: const Icon(Icons.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: appName,
                applicationVersion: version,
                applicationIcon: Image.asset(appIcon, width: 50, height: 50),
              );
            },
          ),
          ListTile(
            title: const Text('利用規約'),
            leading: const Icon(Icons.description),
            onTap: () {
              launchUrl(termsOfServiceLink);
            },
          ),
          ListTile(
            title: const Text('プライバシーポリシー'),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              launchUrl(privacyPolicyLink);
            },
          ),
          ListTile(
            title: const Text('お問い合わせ'),
            leading: const Icon(Icons.contact_support),
            onTap: () {
              launchUrl(contactFormLink);
            },
          ),
          developer_mode
              ? ListTile(
                  title: const Text('開発者モード'),
                  leading: const Icon(Icons.developer_mode),
                  onTap: () {
                    context.go('/testSelect/aoi');
                  },
                )
              : const SizedBox(),
          ListTile(
              title: const Text('ログアウト'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      final profileName =
                          FirebaseAuth.instance.currentUser?.displayName ?? 'ゲスト';
                      return AlertDialog(
                          title: Text('待って！ $profileNameさん'),
                          content: const Text('ログアウトしてよろしいですか？'),
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
        ],
      ),
    );
  }

  void _saveThemeMode(ThemeMode themeMode) {
    ThemePreferences().saveThemeMode(themeMode);
  }
}
