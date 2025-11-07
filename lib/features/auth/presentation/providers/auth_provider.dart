import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/auth/domain/models/models.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final changes = FirebaseAuth.instance.userChanges();
  return changes;
});

final authProvider = NotifierProvider.autoDispose<AuthNotifier, Auth>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<Auth> {
  Auth build(){
    return const Auth();
  }

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
