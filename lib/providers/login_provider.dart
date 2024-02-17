import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/data.dart';

final loginProvider = FutureProvider.autoDispose<bool>((ref) async {
  final repository = ref.read(authRepositoryProvider);
  return repository.googleSignIn();
});
