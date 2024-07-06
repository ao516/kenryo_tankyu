import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/constant.dart';
import '../../providers/providers.dart';

class InputYear extends ConsumerWidget {
  const InputYear({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputDecorator(
      decoration: InputDecoration(
        isDense: true,
        labelText: '学年',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          isExpanded: true,
          hint: const Text('選択してください'),
          icon: const Icon(Icons.expand_more),
          borderRadius: BorderRadius.circular(8.0),
          value: ref.watch(authProvider).year,
          items: enterYears.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
                value: value, child: Text(value.toString(), maxLines: 1));
          }).toList(),
          onChanged: (value) =>
              ref.read(authProvider.notifier).changeYear(value!),
        ),
      ),
    );
  }
}
