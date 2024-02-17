import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/providers/login_provider.dart';

class LoginPage extends ConsumerWidget {
  //this is for go_route navigation
  static LoginPage builder(BuildContext context, GoRouterState state) =>
      const LoginPage();
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            await ref.read(loginProvider.future);
          },
          icon: const Icon(Icons.add),
          label: const Text('Login with Google'),
        ),
      ),
    );
  }

  //thats it's now we can login using google
  // let's display user info
}
