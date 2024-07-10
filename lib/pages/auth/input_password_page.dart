import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPasswordPage extends ConsumerWidget {
  const InputPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('InputPasswordPage')),
    );
  }
}

//try {
//           await firebaseAuth.signInWithEmailAndPassword(
//               email: emailAddress, password: 'password');
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'user-not-found') {
//             if (!context.mounted) return;
//             context.go('/login/create_account');
//           } else if (e.code == 'wrong-password') {
//             if (!context.mounted) return;
//             context.go('/login/input_password');
//           } else {
//             debugPrint('error: ${e.code}');
//           }
//         }