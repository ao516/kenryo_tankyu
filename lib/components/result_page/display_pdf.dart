import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DisplayPdf extends ConsumerStatefulWidget {
  const DisplayPdf({super.key});
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
    final pdfFuture = ref.watch(slidePdfProvider(ref.watch(stringProvider)));
    return Expanded(
      child: pdfFuture.when(
          data: (data) => data == null
              ? const Text('データがありません。')
              : SfPdfViewer.memory(data),
          error: (error, stack) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
