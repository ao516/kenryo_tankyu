import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/value.dart';

final selectedChangeInfoDropdownProvider =
    StateProvider.autoDispose<String?>((ref) => null);

class ChangeInfoForm extends ConsumerWidget {
  const ChangeInfoForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? selected = ref.watch(selectedChangeInfoDropdownProvider);
    final notifier = ref.read(selectedChangeInfoDropdownProvider.notifier);
    return Column(children: [
      const SizedBox(height: 16),
      DropdownButton(
        items: changeInfoList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: SizedBox(width: 200,child: Text(value)));
        }).toList(),
        onChanged: (value) => notifier.state = value,
        value: selected,
        hint: const Text('選択してください'),
      ),
      const SizedBox(height: 16),
      TextFormField(
          decoration: const InputDecoration(
        labelText: 'メールアドレス',
        hintText: 'a',
      )),
    ]);
  }
}
