import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailControllerProvider = StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());
final passwordControllerProvider = StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());
final errorMessageProvider = StateProvider.autoDispose<String>((ref) => '');
final obscureTextProvider = StateProvider.autoDispose<bool>((ref) => true);
final authEmailVerifiedProvider = StateProvider.autoDispose<UserCredential?>((ref) => null);

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(obscureTextProvider);
    final obscureTextNotifier = ref.read(obscureTextProvider.notifier);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final errorMessage = ref.watch(errorMessageProvider);
    final errorMessageNotifier = ref.read(errorMessageProvider.notifier);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Welcome to 探究アーカイブ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Image.asset('assets/images/appIcon.png',
                    width: 100, height: 100),
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
                        const Text('縣陵生であることを確認',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 10),
                        const Text(
                            'このアプリは縣陵生のみが利用できます。\nまずは、縣陵アカウントのメールアドレスとパスワードを入力してください。'),
                        const SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            suffixText: '@kenryo.ed.jp',
                            labelText: 'メールアドレス',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    obscureTextNotifier.state = !obscureText,
                              ),
                              labelText: '(初期)パスワード',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorText: errorMessage),
                          obscureText: obscureText,),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final result = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: '${emailController.text}@gmail.com',
                                  password: passwordController.text,
                                );
                                final emailVerified = result.user?.emailVerified;
                                if (emailVerified == true) {
                                  debugPrint('ログイン成功');
                                } else {
                                  result.user?.sendEmailVerification();
                                  debugPrint('メールを送信しました');
                                }
                              } on FirebaseAuthException catch (e) {
                                errorMessageNotifier.state = e.code;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text('送信'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
