import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/auth_provider.dart';

import '../../constant/constant.dart';

class LoginPage extends ConsumerWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('ログイン',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                const SizedBox(height:10),
                Image.asset(appIcon,
                    width: 80, height: 80),
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
                        const Text('メールアドレスとパスワードを入力してください'),
                        const SizedBox(height: 20),
                        InputEmail(ref.watch(authProvider).email?? '', true),
                        const SizedBox(height: 20),
                        InputPasswordForLogin(ref.watch(authProvider).password?? ''),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('初めてアプリを使う場合',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    InkWell(
                        child: const Text('新規作成',
                            style: TextStyle(color: Colors.blue)),
                        onTap: () => context.push('/welcome/verify_name')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('パスワードを忘れた場合',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    InkWell(
                        child: const Text('パスワードのリセット',
                            style: TextStyle(color: Colors.blue)),
                        onTap: () => context.push('/welcome/login/reset_password')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
