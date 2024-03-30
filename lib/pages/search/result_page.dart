import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class ResultPage extends ConsumerWidget {
  final Searched beforeSearched;
  const ResultPage({super.key, required this.beforeSearched});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searched = ref.watch(searchedProvider(beforeSearched));
    return Scaffold(
        appBar: const HeaderForResultPage(),
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
                    DisplayPdf(searched: searched),
                  ]),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Text(error.toString())));
  }
}
