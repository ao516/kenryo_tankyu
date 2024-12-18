import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/constant.dart';
import '../../db/db.dart';
import '../../providers/providers.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 60),
                      Image.asset(appIcon, width: 80),
                      const SizedBox(height: 10),
                      themeMode == ThemeMode.dark
                          ? Image.asset(
                              'assets/images/text/archive_white.png',
                              width: 200,
                            )
                          : Image.asset(
                              'assets/images/text/archive_black.png',
                              width: 200,
                            ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('松本県ケ丘高校生であることを確認',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 5),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const InputYear(),
                                const SizedBox(height: 20),
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
                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: ref.watch(authProvider).email != null && ref.watch(authProvider).year != null ? () => _checkEmail(context, ref): null,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text('新規登録'),
                          ),
                        ),
                        //またはログイン
                        const SizedBox(height: 20),
                        const Center(child: Text('既に登録済みの場合は')),
                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => context.push('/welcome/login'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Theme.of(context).dividerColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text('ログイン'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '探究アーカイブを利用することで、',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: 'プライバシーポリシー',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(privacyPolicyLink),
                ),
                TextSpan(
                  text: 'および',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: '利用規約',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(termsOfServiceLink),
                ),
                TextSpan(
                    text: 'に同意することとします。',
                    style: Theme.of(context).textTheme.bodySmall),
              ])),
            ),
          ],
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
