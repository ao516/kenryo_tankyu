import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AuthAppBar(percent: 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Text('ログイン',
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('メールアドレスを入力',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      InputEmail(ref.watch(authProvider).email ?? '', true),
                      const SizedBox(height: 20),
                      Text('パスワードを入力',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      InputPasswordForLogin(
                          ref.watch(authProvider).password ?? ''),
                    ],
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     const Text('パスワードを忘れた場合',
              //         style: TextStyle(fontWeight: FontWeight.bold)),
              //     const SizedBox(width: 10),
              //     InkWell(
              //         child: const Text('パスワードのリセット',
              //             style: TextStyle(color: Colors.blue)),
              //         onTap: () =>
              //             context.push('/welcome/login/reset_password')),
              //     SizedBox(width: 20),
              //   ],
              // ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
