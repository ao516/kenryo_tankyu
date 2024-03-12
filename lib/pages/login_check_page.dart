import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/pages/home_page.dart';
import 'package:kenryo_tankyu/pages/login_page.dart';

import '../providers/auth_provider.dart';

class LoginCheckPage extends ConsumerWidget {
  const LoginCheckPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authStateChangesProvider);
    return authStateAsync.when(
      data: (user) => user != null ? const HomePage() : const LoginPage(),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
