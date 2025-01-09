import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';


class VerifyNamePage extends ConsumerWidget {
  const VerifyNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AuthAppBar(),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                (Scaffold.of(context).appBarMaxHeight ?? 0),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Text('縣陵生であることを確認',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                Card(
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('所属を選択',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        const InputYear(),
                        const SizedBox(height: 20),
                        Text('メールアドレスを入力',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        InputEmail(
                            ref.read(authProvider).email ?? '', true),
                        Consumer(builder: (context, ref, child) {
                          final limit = ref.watch(authProvider).limit;
                          if (limit == 5) {
                            return const SizedBox();
                          }
                          return Text(
                              'メールアドレスが存在しないか、学年が間違っています。もう一度入力してください。\n残り$limit回',
                              style: const TextStyle(color: Colors.red));
                        }),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: ref.watch(authProvider).email != null &&
                          ref.watch(authProvider).affiliation != null
                      ? () => _verifyName(context, ref)
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text('認証する'),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      }),
    );
  }

  _verifyName(BuildContext context, WidgetRef ref) async {
    final auth = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final emailAddress = '${auth.email}@kenryo.ed.jp';
    final firestore = FirebaseFirestore.instance;
    debugPrint('emailAddress: $emailAddress\nyear: ${auth.affiliation} ');
    final searchTerms = firestore
        .collection('users')
        .doc('${auth.affiliation?.displayName}')
        .collection('users')
        .where('email', isEqualTo: emailAddress); //自分の入学年度に自分のメールアドレスが存在するかを確認
    await searchTerms.get().then((value) async {
      if (value.docs.isNotEmpty) {
        final userName = value.docs[0].get('name');

        //登録済みかどうかを確認。登録済みならログイン画面への誘導をする。未登録ならアカウント作成画面へ。
        final alreadyRegistered = value.docs[0].get('registered');
        if (alreadyRegistered) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Column(
                children: [
                  const Text('このメールアドレスは既に登録されています'),
                  ElevatedButton(
                      onPressed: () => context.go('/welcome/login'),
                      child: const Text('ログイン画面に移動')),
                ],
              ),
            ),
          );
        } else {
          notifier.changeUserName(userName);
          context.go('/welcome/create_password');
        }

        notifier.changeUserName(userName);
        context.go('/welcome/create_password');
      } else {
        notifier.decrementLimit();
      }
    });
  }
}
