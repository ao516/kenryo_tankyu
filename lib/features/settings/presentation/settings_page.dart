import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/settings/data/device_settings_db.dart';
import 'package:kenryo_tankyu/features/settings/data/settings_db.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationSetting = ref.watch(notificationSettingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: SingleChildScrollView(
        child: ListBody(
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
                          FirebaseAuth.instance.currentUser?.displayName ??
                              'ゲスト';
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
              },
            ),
            ListTile(
              title: const Text('アカウント削除'),
              leading: const Icon(Icons.delete),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    final profileName =
                        FirebaseAuth.instance.currentUser?.displayName ?? 'ゲスト';
                    return AlertDialog(
                      title: Text('待って！ $profileNameさん'),
                      content: const Text('アカウントを削除してよろしいですか？'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('いいえ'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // ユーザー情報を更新
                            final email =
                                FirebaseAuth.instance.currentUser?.email;
                            final firestore = FirebaseFirestore.instance;
                            final term = firestore
                                .collection('users')
                                .where('email', isEqualTo: email)
                                .limit(1);
                            try {
                              await reauthenticateUser();
                              await FirebaseAuth.instance.currentUser?.delete();
                              await term.get().then((value) async {
                                if (value.docs.isNotEmpty) {
                                  await value.docs.first.reference.update({
                                    'registered': false,
                                  });
                                }
                              });
                              Navigator.of(context).pop();
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'requires-recent-login') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('再認証が必要です。再度ログインしてください。'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('エラーが発生しました: ${e.message}'),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('はい'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> reauthenticateUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: 'your-password', // ユーザーのパスワードを取得する必要があります
      );
      await user.reauthenticateWithCredential(credential);
    }
  }

  void _saveThemeMode(ThemeMode themeMode) {
    ThemePreferences().saveThemeMode(themeMode);
  }
}
