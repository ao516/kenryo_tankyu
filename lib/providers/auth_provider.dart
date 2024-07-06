import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/auth.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

final authProvider = StateNotifierProvider.autoDispose<AuthNotifier, Auth>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier() : super(const Auth());

  void changeYear(int year) {
    state = state.copyWith(year: year);
  }

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePassword(String password) {
    state = state.copyWith(passwordForCreate1: password);
  }

  void changeObscureText() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  void decrementCheckAccountExistLimit(){
    state = state.copyWith(checkAccountExistLimit: state.checkAccountExistLimit - 1);
  }

  void decrementCheckPasswordLimit(){
    state = state.copyWith(checkPasswordLimit: state.checkPasswordLimit - 1);
  }
}
