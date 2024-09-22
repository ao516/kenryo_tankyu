import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import '../../providers/providers.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

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
                Image.asset('assets/images/appIcon.png',
                    width: 100, height: 100),
                const Text('新規作成',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                        const Text('縣陵生であることを確認',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 10),
                        const Text(
                            'このアプリは松本県ヶ丘高校に在籍する生徒のみが利用できます。\nまずは、あなたの学年と縣陵アカウントのメールアドレスを入力してください。'),
                        const SizedBox(height: 20),
                        const InputYear(),
                        const SizedBox(height: 20),
                        InputEmail(ref.read(authProvider).email?? '',true),
                        const SizedBox(height: 20),
                        Consumer(builder: (context, ref, child) {
                          final limit =
                              ref.watch(authProvider).limit;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('すでにアカウントをお持ちの場合',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    InkWell(
                        child: const Text('ログイン',
                            style: TextStyle(color: Colors.blue)),
                        onTap: () => context.push('/welcome/login')),
                  ],
                ),
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
    final firestore = FirebaseFirestore.instance;
    debugPrint('emailAddress: $emailAddress\nyear: ${auth.year} ');
    final searchTerms = firestore
        .collection('users')
        .doc('${auth.year}')
        .collection('users')
        .where('email', isEqualTo: emailAddress); //自分の入学年度に自分のメールアドレスが存在するかを確認
    await searchTerms.get().then((value) async {
      if (value.docs.isNotEmpty) {
        final userName = value.docs[0].get('name');
        notifier.changeUserName(userName);
        context.go('/welcome/create_account');
      } else {
        notifier.decrementLimit();
      }
    });
  }
}
