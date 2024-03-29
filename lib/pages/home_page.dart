import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class HomePage extends ConsumerWidget {
  //this is for go_route navigation
  static HomePage builder(BuildContext context, GoRouterState state) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: [
          IconButton(onPressed: () async {
            // 内部で保持しているログイン情報等が初期化される
            await FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.logout)),
        ],
      );
  }
}

// now let's test on android emulator
