import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/service/firestore_service.dart';

import '../../providers/providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            'このアプリは松本県ヶ丘高校に在籍する生徒のみが利用できます。\nまずは、あなたの学年と縣陵アカウントのメールアドレスを入力してください。'),
                        const SizedBox(height: 20),
                        const InputYear(),
                        const SizedBox(height: 20),
                        const InputEmail(),
                        const SizedBox(height: 20),
                        Consumer(builder: (context, ref, child) {
                          final limit =
                              ref.watch(authProvider).checkAccountExistLimit;
                          if (limit == 5) {
                            return const SizedBox();
                          }
                          return Text(
                              'メールアドレスが存在しないか、学年が間違っています。もう一度入力してください。\n残り$limit回',
                              style: const TextStyle(color: Colors.red));
                        }),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _checkEmail(context, ref),
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

  _checkEmail(BuildContext context, WidgetRef ref) async {
    final auth = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final emailAddress = '${auth.email}@kenryo.ed.jp';
    final firebaseAuth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;
    debugPrint('emailAddress: $emailAddress\nyear: ${auth.year} ');
    final searchTerms = firestore
        .collection('users')
        .doc('${auth.year}')
        .collection('users')
        .where('email',
        isEqualTo: emailAddress); //自分の入学年度に自分のメールアドレスが存在するかを確認
    await searchTerms.get().then((value) {
      debugPrint(value.docs.toString());
      if (value.docs.isNotEmpty) {
        try {
          firebaseAuth.signInWithEmailAndPassword(
              email: emailAddress, password: 'samplePassword');
        } on FirebaseAuthException catch (e) {
          debugPrint('ここ来たよー${e.code.toString()}');
          if (e.code == 'user-not-found') {
            debugPrint('user-not-foundでしたよ');
            context.push('/login/create_account');
          } else if (e.code == 'wrong-password') {
            context.push('/login/input_password');
          } else {
            debugPrint('ここ来たよー${e.toString()}');
          }
        }
      } else {
        notifier.decrementCheckAccountExistLimit();
      }
    });
  }
}
