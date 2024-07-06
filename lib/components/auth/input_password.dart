import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class InputPassword extends ConsumerStatefulWidget {
  const InputPassword({super.key});

  @override
  ConsumerState<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends ConsumerState<InputPassword> {
  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final controller = TextEditingController();
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));  //カーソルを末尾に移動

    return TextField(
      obscureText: auth.obscureText,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: auth.obscureText
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          onPressed: () {
            notifier.changePassword(controller.text);
            notifier.changeObscureText();
            },
        ),
        labelText: 'パスワード',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: auth.errorMessage,
      ),
      onSubmitted: (text) => notifier.changePassword(text),
    );
  }
}
