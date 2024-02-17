import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/data/data.dart';

final getCurrentUserProvider = StreamProvider.autoDispose<AppUser>((ref) {
  final controller = StreamController<AppUser>();
  final repository = ref.watch(authRepositoryProvider);

  final sub = repository.getCurrentUser().listen((user) {
    if (user != null) {
      return controller.sink.add(user);
    }
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
