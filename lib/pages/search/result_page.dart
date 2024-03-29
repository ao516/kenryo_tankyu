import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/components/result_page/pdf_choice_chip.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultPage extends ConsumerWidget {
  final Searched beforeSearched;
  const ResultPage({super.key, required this.beforeSearched});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searched = ref.watch(searchedProvider(beforeSearched));
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                //TODO: ダウンロード機能、いつかやる。
                debugPrint('未実装');
              },
              icon: const Icon(Icons.download),
            ),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('情報の変更を提案'),
                ),
                const PopupMenuItem(
                  child: Text('情報をクリップボードにコピー'),
                ),
              ];
            })
          ],
        ),
        body: searched.when(
            data: (searched) {
              debugPrint('searched: $searched');
              if (searched == null) {
                return const Text('データがありません。');
              } else {

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Column(children: [
                    WorkTitle(searched: searched),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: WorkDetailsTable(searched: searched),
                    ),
                    PdfChoiceChip(searched: searched),
                    const DisplayPdf(),
                  ]),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Text(error.toString())));
  }
}
