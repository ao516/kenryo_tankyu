import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

//now let's create a repository
class AuthDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthDatasource(this._auth, this._firestore);

  //login
  Future<bool> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) return false;

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    try {
      final result = await _auth.signInWithCredential(oauthCredentials);
      final user = result.user;

      await _firestore.collection('users').doc(user?.uid).set({
        'username': user?.displayName,
        'email': user?.email,
        'userId': user?.uid,
        'imgUrl': user?.photoURL,
      });

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  //logout
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      GoogleSignIn().signOut(),
    ]);
  }

  //list to user auth state if logged in or not
  // based on that we will navigate in the right screen
  Stream<User?> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //fetch the current user info
  Stream<QuerySnapshot<Object?>> getCurrentUser() async* {
    await _auth.currentUser?.reload();
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      yield* _firestore
          .collection('users')
          .where('userId', isEqualTo: currentUser.uid)
          .limit(1)
          .snapshots();
    }
  }
}
