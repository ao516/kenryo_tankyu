import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/auth/domain/auth.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final changes = FirebaseAuth.instance.userChanges();
  return changes;
});

final authProvider = StateNotifierProvider.autoDispose<AuthNotifier, Auth>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier() : super(const Auth());

  void changeVerifyEmail() {
    state = state.copyWith(confirmVerifyEmail: !state.confirmVerifyEmail);
  }

  void changeUserName(String userName) {
    state = state.copyWith(userName: userName);
  }

  void changeAffiliation(Affiliation affiliation) {
    state = state.copyWith(affiliation: affiliation);
  }

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePassword(String password) {
    state = state.copyWith(password: password);
  }

  void decrementLimit(){
    state = state.copyWith(limit: state.limit - 1);
  }

}
