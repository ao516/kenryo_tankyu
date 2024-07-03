import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final emailProvider = StateProvider.autoDispose<String>((ref) => '');
final passwordProvider = StateProvider.autoDispose<String>((ref) => '');
final errorMessageProvider = StateProvider.autoDispose<String>((ref) => '');

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final passwordNotifier = ref.read(passwordProvider.notifier);
    final errorMessage = ref.watch(errorMessageProvider);
    final emailNotifier = ref.read(emailProvider.notifier);
    final errorMessageNotifier = ref.read(errorMessageProvider.notifier);
    final emailController = TextEditingController(text: email);
    final passwordController = TextEditingController(text: password);

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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('メールアドレスを入力してログインまたは新規登録を行ってください'),
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
                          onChanged: (value) => emailNotifier.state = value,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: '${emailController.text}@kenryo.ed.jp',
                                password: 'checkIfUserExists',
                              );
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
                          child: const Text('次へ'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                switchWidget(errorMessage, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget switchWidget(String errorMessage, WidgetRef ref) {
    final password = ref.watch(passwordProvider);
    final email = ref.watch(emailProvider);
    final passwordNotifier = ref.read(passwordProvider.notifier);
    final errorMessage = ref.watch(errorMessageProvider);
    final errorMessageNotifier = ref.read(errorMessageProvider.notifier);
    final passwordController = TextEditingController(text: password);
    if (errorMessage == 'user-not-found') {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('ユーザーが見つかりませんでした。新規登録をしましょう！'),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorText: errorMessage),
                obscureText: true,
                onChanged: (value) => passwordNotifier.state = value,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else if (errorMessage == 'wrong-password') {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorText: errorMessage),
                obscureText: true,
                onChanged: (value) => passwordNotifier.state = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: '${email}@kenryo.ed.jp',
                        password: passwordController.text);
                  } on FirebaseAuthException catch (e) {
                    errorMessageNotifier.state = e.code;
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('次へ'),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox(height: 0);
    }
  }
}
