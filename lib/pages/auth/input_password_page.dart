import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/auth_provider.dart';

class InputPasswordPage extends ConsumerWidget {

  const InputPasswordPage({super.key});

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
                const Text('探究アーカイブにログイン',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Image.asset('assets/images/appIcon.png',
                    width: 100, height: 100),
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
                        InputPasswordForLogin(ref.watch(authProvider).passwordForCreate1?? ''),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _login(context, ref),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: const Text('認証'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('アカウントをお持ちでない場合',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    InkWell(
                        child: const Text('新規作成',
                            style: TextStyle(color: Colors.blue)),
                        onTap: () => context.push('/login')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context, WidgetRef ref) {}
}
