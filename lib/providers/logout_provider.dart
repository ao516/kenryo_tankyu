import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/data.dart';

final logoutProvider = FutureProvider.autoDispose<void>((ref) async {
  final repository = ref.read(authRepositoryProvider);
  return repository.signOut();
});
