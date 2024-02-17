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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("探究アーカイブ",style: TextStyle(color: Colors.red,fontSize: 20),),
            SizedBox(width: 200,height: 200,child: Image.asset('images/appIcon.png'),),
            ElevatedButton.icon(
              onPressed: () async {
                await ref.read(loginProvider.future);
              },
              icon: const Icon(Icons.add),
              label: const Text('Googleでログインする'),
            ),
          ],
        ),
      ),
    );
  }
}
