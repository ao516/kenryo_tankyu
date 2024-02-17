import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/data.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.read(authDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});
