import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

final intProvider = StateProvider.autoDispose((ref) => 0); //choiceChipの選択肢を管理する簡易的なProvider
final stringProvider = StateProvider.autoDispose((ref) => '10320224'); ///todo 初期値のpdfのdocumentId。いつか変える

class DisplayPdf extends ConsumerStatefulWidget {
  const DisplayPdf({required this.choiceList,required this.documentId, super.key});
  final List choiceList;
  final String documentId;

  @override
  DisplayPdfState createState() => DisplayPdfState();
}

class DisplayPdfState extends ConsumerState<DisplayPdf> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.documentId;  //documentIdの１文字目（現在はデータ型の0が入っている）を消去
    final pdfFuture = ref.watch(slidePdfProvider(ref.watch(stringProvider)));
    final notifier = ref.watch(stringProvider.notifier);
    return Column(
      children: [
        Row(
          children: widget.choiceList.map((choice) {
            return Expanded(
              child: Consumer(builder: (context, ref, child) {
                return Column(
                  children: [
                    ChoiceChip(
                      avatar: Container(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      label: Text(choice),
                      selected: widget.choiceList.indexOf(choice) ==
                          ref.watch(intProvider),
                      onSelected: (bool selected) {
                        ref.read(intProvider.notifier).state =
                            widget.choiceList.indexOf(choice);
                        choice == 'スライド'
                            ? notifier.state =
                                '1$id'
                            : choice == 'レポート'
                                ? notifier.state =
                                    '2$id'
                                : choice == 'ポスター'
                                    ? notifier.state =
                                        '3$id'
                                    : notifier.state =
                                        '4$id';
                      },
                    ),
                  ],
                );
              }),
            );
          }).toList(),
        ),
        SizedBox(
          height: 500,
          child: pdfFuture.when(
              data: (data) => SfPdfViewer.memory(data),
              error: (error, stack) => Text(error.toString()),
              loading: () => const CircularProgressIndicator()),
        ),
      ],
    );
  }
}
