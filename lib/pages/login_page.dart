import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "松本県ケ丘高等学校\n探究アーカイブ",
              style: TextStyle(
                  height: 1.5, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            CircleAvatar(
                radius: 100, child: Image.asset('assets/images/appIcon.png')),
            const SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('松本県ケ丘高等学校の過去の探究作品を検索できるアプリです。'
                    '\nログインには高校で配布される@kenryo.ed.jpのメールアドレスが必要です。'
                    '\n以下のボタンから認証を行ってください。',style: TextStyle(height: 1.5)),
              ),
            ),
            const Spacer(),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                await Authentication.signInWithGoogle(context: context);
              },
              icon: Image.asset('assets/images/google.png',
                  width: 20, height: 20),
              label: const Text('Googleでログインする'),
            ),
          ],
        ),
      ),
    );
  }
}

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final OAuthProvider googleProvider = OAuthProvider('google.com');
      googleProvider.setCustomParameters({
        'hd': 'kenryo.ed.jp',
      });

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }
}
