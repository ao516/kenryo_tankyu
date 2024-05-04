import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';

class HomePage extends ConsumerWidget {
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);
    final userName = authStateAsync.value?.displayName;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('$userNameさん、ログアウトする'),
              IconButton(
                  onPressed: () async {
                    // 内部で保持しているログイン情報等が初期化される
                    await FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.logout)),
            ],
          ),
          Card(
            child: ListTile(
              title: const Text('縣陵先生図鑑'),
              onTap: () {
                context.push('/teacher');
              },
            ),
          ),
        ],
      ),
    );
  }
}

// now let's test on android emulator
