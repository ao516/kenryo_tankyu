import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SearchDropButton extends ConsumerWidget {
  const SearchDropButton(
      {required this.name, required this.choices, super.key});
  final String name;
  final List<String> choices;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(searchProvider.select((state) => name == '期間'
        ? state.year
        : name == 'イベント名'
            ? state.eventName
            : name == '学科指定'
                ? state.departure
                : state.year));

    ///todo : こんな書き方したくないよーーー笑
    return Row(
      children: [
        Flexible(
            flex: 1,
            child:
                Container(alignment: Alignment.centerRight, child: Text(name))),
        const SizedBox(width: 8.0),
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade200,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  isExpanded: true,
                  icon: const Icon(Icons.expand_more),
                  borderRadius: BorderRadius.circular(8.0),
                  hint: const Text('指定なし'),
                  value: selectedYear,
                  items: choices.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) => name == '期間'
                      ? ref.read(searchProvider.notifier).selectedYear(value!)
                      : name == 'イベント名'
                          ? ref
                              .read(searchProvider.notifier)
                              .selectedEventName(value!)
                          : name == '学科指定'
                              ? ref
                                  .read(searchProvider.notifier)
                                  .selectedDeparture(value!)
                              : ref
                                  .read(searchProvider.notifier)
                                  .selectedYear(value!)

                  ///todo : こんな書き方したくないよーーー笑
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
