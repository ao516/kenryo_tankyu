import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

enum DocumentType {
  slide,
  report,
  poster,
  thesis,
}

extension DocumentTypeExtension on DocumentType {
  String get label {
    switch (this) {
      case DocumentType.slide:
        return 'スライド';
      case DocumentType.report:
        return 'レポート';
      case DocumentType.poster:
        return 'ポスター';
      case DocumentType.thesis:
        return '論文';
    }
  }

  String get idSuffix {
    switch (this) {
      case DocumentType.slide:
        return '1';
      case DocumentType.report:
        return '2';
      case DocumentType.poster:
        return '3';
      case DocumentType.thesis:
        return '4';
    }
  }
}

class PdfChoiceChip extends ConsumerWidget {
  final Searched searched;
  const PdfChoiceChip({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stringProviderNotifier = ref.read(stringProvider.notifier);
    final isSameScreen = ref.watch(isSameScreenProvider);
    final isSameScreenNotifier = ref.read(isSameScreenProvider.notifier);
    final partOfId = searched.documentID.substring(0, 7);
    final List<DocumentType> list = [];
    if (searched.existsSlide!) list.add(DocumentType.slide);
    if (searched.existsReport!) list.add(DocumentType.report);
    if (searched.existsPoster!) list.add(DocumentType.poster);
    if (searched.existsThesis!) list.add(DocumentType.thesis);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isSameScreen) return;
      stringProviderNotifier.state = '$partOfId${list[0].idSuffix}';
      isSameScreenNotifier.state = true;
    }); //最初に表示されるpdfのidを決定

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
                label: Text(choice.label),
                selected: list.indexOf(choice) == ref.watch(intProvider),
                onSelected: (bool selected) {
                  if (!selected) return; //同じチップを押した場合はなにもしない
                  ref.read(intProvider.notifier).state = list.indexOf(choice);
                  stringProviderNotifier.state = '$partOfId${choice.idSuffix}';
                  debugPrint('選択されたチップは${choice.label}です。');
                  debugPrint('選択されたチップのidは$partOfId${choice.idSuffix}です。');
                },
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
