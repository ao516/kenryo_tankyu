import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/components.dart';
import '../constant/constant.dart';
import '../providers/providers.dart';

class HomePage extends ConsumerWidget {
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);
    final user = authStateAsync.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                user == null
                    ? const Text('ログアウトする')
                    : Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(user.photoURL!),
                          ),
                          const SizedBox(width: 8),
                          Text('${user.displayName}さん、ログアウトする'),
                        ],
                      ),
                IconButton(
                    onPressed: () async {
                      // 内部で保持しているログイン情報等が初期化される
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(Icons.logout)),
              ],
            ),
            const SizedBox(height: 8),
            const Text('あなたへのおすすめ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Card(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: ResultPreviewContent(searched: testSearchedValue)),
            const SizedBox(height: 16),
            const Text('コンテンツ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const ContentCarousel(),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                title: const Text('縣陵先生図鑑'),
                onTap: () {
                  context.push('/teacher');
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('お知らせ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 400,
                child: NotificationList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// now let's test on android emulator
