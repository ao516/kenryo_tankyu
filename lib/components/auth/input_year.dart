import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import '../../providers/providers.dart';

class InputYear extends ConsumerWidget {
  const InputYear({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputDecorator(
      decoration: InputDecoration(
        isDense: true,
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
          value: ref.watch(authProvider).affiliation,
          items: Affiliation.values
              .map<DropdownMenuItem<Affiliation>>((Affiliation value) {
            String name = value.displayName;
            if (value.enterYear != null) {
              final now = DateTime(2025, 1, 9);
              final pre = now.month < 4 ? "新" : "現";
              final differences = now.year - value.enterYear! + 1;
              switch (differences) {
                case < 1:
                  name = '未来の人';
                  break;
                case < 4:
                  name = '$name（$pre$differences年生）';
                  break;
                default:
                  name = '$name（OB・OG${differences - 3}年目）';
              }
            }
            return DropdownMenuItem<Affiliation>(
                value: value, child: Text(name, maxLines: 1));
          }).toList(),
          onChanged: (value) =>
              ref.read(authProvider.notifier).changeAffiliation(value!),
        ),
      ),
    );
  }
}
