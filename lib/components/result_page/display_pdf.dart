import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DisplayPdf extends ConsumerWidget {
  final Searched searched;
  const DisplayPdf({super.key,required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pdfFuture = ref.watch(slidePdfProvider(ref.watch(stringProvider)));
    return Expanded(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          pdfFuture.when(
              data: (data) => data == null
                  ? const Text('データがありません。')
                  : SfPdfViewer.memory(data),
              error: (error, stack) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator())),
          IconButton(
              onPressed: () => context.push('/result/pdfExpand',extra: searched),
              icon: const Icon(Icons.expand),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey,
              )),
        ],
      ),
    );
  }
}