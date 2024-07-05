import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user = null) {
      return;
    }
    return user;
  });
});