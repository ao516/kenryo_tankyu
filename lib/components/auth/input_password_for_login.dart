import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/providers.dart';

class InputPasswordForLogin extends ConsumerStatefulWidget {
  final String password;
  final bool isDeveloper; 
  const InputPasswordForLogin(this.password, this.isDeveloper, {super.key});

  @override
  ConsumerState<InputPasswordForLogin> createState() =>
      _InputPasswordForLoginState();
}

class _InputPasswordForLoginState extends ConsumerState<InputPasswordForLogin> {
  late TextEditingController _controller;
  bool _obscureText = true;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            errorText: _passwordError,
            suffixIcon: IconButton(
              icon: _obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            labelText: 'パスワード',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: _validatePassword,
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: _passwordError == null &&
                    ref.watch(authProvider).email != null &&
                    _controller.text != ''
                ? () async {
                    await _login(context, ref, _controller.text, widget.isDeveloper);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text('認証'),
          ),
        ),
      ],
    );
  }

  Future<void> _login(
      BuildContext context, WidgetRef ref, String password, bool isDeveloper) async {
    final firebaseAuth = FirebaseAuth.instance;
    final email = '${ref.watch(authProvider).email!}${isDeveloper ? '@developer.com' : '@kenryo.ed.jp'}';
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ログイン成功時にFCMトークンを取得
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? fcmToken = await messaging.getToken();
      debugPrint('FCMトークン: $fcmToken');

      // ユーザー情報を更新
      final firestore = FirebaseFirestore.instance;
      final term = firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1);
      await term.get().then((value) async {
        if (value.docs.isNotEmpty) {
          await value.docs.first.reference.update({
            'registered': true,
          });
        }
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('メールアドレスが見つかりませんでした'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
        content: Column(
          children: [
            const Text('パスワードが間違っています'),
            ElevatedButton(
            onPressed: () =>
            context.go('/welcome/login/reset_password'),
            child: const Text('パスワードをリセットする')),
          ],
        ),
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
  }

  void _validatePassword(String value) {
    if (value.length < 8) {
      setState(() {
        _passwordError = 'パスワードは8桁以上です';
      });
    } else {
      setState(() {
        _passwordError = null;
      });
    }
  }
}
