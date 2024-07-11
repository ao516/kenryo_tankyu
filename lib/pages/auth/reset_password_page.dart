import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';

import '../../providers/providers.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final confirmVerifiedEmail = auth.confirmVerifyEmail;
    final email = auth.email;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('パスワードをリセット',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Image.asset('assets/images/appIcon.png',
                    width: 100, height: 100),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('メールアドレスを入力'),
                        const SizedBox(height: 20),
                        InputEmail(ref.watch(authProvider).email ?? '', true),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                              onPressed: email != null
                                  ? () => _sendResetMail(context,ref, email)
                                  : null,
                              child: const Text('リセットメールを送信')),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                confirmVerifiedEmail
                    ? ElevatedButton(
                        onPressed: () =>
                            context.go('/welcome/login'),
                        child: const Text('ログインし直す'))
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _sendResetMail(BuildContext context,WidgetRef ref, String email) async {
    final firebaseAuth = FirebaseAuth.instance;
    email = '$email@kenryo.ed.jp';
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      ref.read(authProvider.notifier).changeVerifyEmail();
      if (!context.mounted) return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              children: [
                const Text('ユーザーが見つかりませんでした'),
                ElevatedButton(
                    onPressed: () => context.go('/welcome'),
                    child: const Text('アカウントを新規作成する')),
              ],
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('エラーが発生しました。${e.code}'),
          ),
        );
      }
    }
  }
}
