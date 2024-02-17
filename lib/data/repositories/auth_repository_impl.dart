import 'package:firebase_auth/firebase_auth.dart';
import 'package:kenryo_tankyu/data/data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;
  AuthRepositoryImpl(this._datasource);

  @override
  Stream<User?> authStateChanges() async* {
    try {
      yield* _datasource.authStateChanges();
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }

  @override
  Stream<AppUser?> getCurrentUser() async* {
    try {
      final result = _datasource.getCurrentUser();
      yield* result.map((snapshot) {
        if (snapshot.docs.isEmpty) return null;
        final doc = snapshot.docs.first;
        return AppUser.fromJson(
          doc.data() as Map<String, dynamic>,
        );
      });
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }

  @override
  Future<bool> googleSignIn() async {
    try {
      return await _datasource.googleSignIn();
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _datasource.signOut();
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }
}
