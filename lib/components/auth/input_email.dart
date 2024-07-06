import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class InputEmail extends ConsumerStatefulWidget {
  const InputEmail({super.key});

  @override
  ConsumerState<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends ConsumerState<InputEmail> {

  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier);
  }


  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(authProvider.notifier);
    final controller = TextEditingController();

    return TextField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_.+-]')),  //メールアドレスの入力制限
      ],
      controller: controller,
      decoration: InputDecoration(
        suffixText: '@kenryo.ed.jp',
        labelText: 'メールアドレス',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (text) => notifier.changeEmail(text),
    );
  }
}