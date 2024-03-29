import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class PdfChoiceChip extends ConsumerWidget {
  final Searched searched;
  const PdfChoiceChip({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(stringProvider.notifier);
    final partOfId = searched.documentID.substring(1);
    final list = [];
    if (searched.existsSlide!) list.add('スライド');
    if (searched.existsReport!) list.add('レポート');
    if (searched.existsPoster!) list.add('ポスター');
    if (searched.existsThesis!) list.add('論文');

    ///TODO 最初に呼び出すpdfを決定している。ちょっとコード汚いな…。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(stringProvider.notifier).state = list[0] == 'スライド'
          ? '1$partOfId'
          : list[0] == 'レポート'
              ? '2$partOfId'
              : list[0] == 'ポスター'
                  ? '3$partOfId'
                  : '4$partOfId';
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list.map((choice) {
          return Consumer(builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                avatar: Container(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                label: Text(choice),
                selected: list.indexOf(choice) == ref.watch(intProvider),
                onSelected: (bool selected) {
                  ref.read(intProvider.notifier).state = list.indexOf(choice);
                  choice == 'スライド'
                      ? notifier.state = '1$partOfId'
                      : choice == 'レポート'
                          ? notifier.state = '2$partOfId'
                          : choice == 'ポスター'
                              ? notifier.state = '3$partOfId'
                              : notifier.state = '4$partOfId';
                },
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
