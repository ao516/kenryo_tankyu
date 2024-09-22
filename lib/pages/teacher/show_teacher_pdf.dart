import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/pages/teacher/teacher_provider.dart';
import 'package:kenryo_tankyu/service/service.dart';

class ShowTeacherPdfPage extends ConsumerWidget {
  const ShowTeacherPdfPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<String> selectedTeacher = ref.watch(selectedTeacherProvider);

    return Scaffold(appBar: AppBar(),body: Column(
      children: [
        FutureBuilder<Uint8List?>(
          future: _getPdf(selectedTeacher[2]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.data == null) {
                return const Text('データがありません。');
              }
              return PDFView(
                pdfData: snapshot.data!,
                enableSwipe: true,
                autoSpacing: false,
                pageFling: false,
                pageSnap: false,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),

        Text(selectedTeacher[0]),
      ],
    ));
  }
  Future<Uint8List?> _getPdf(String id) async {
    final Uint8List? localData = await PdfDbController.instance.getLocalPdf(id);
    if (localData != null) {
      return localData;
    }
    final Uint8List? remoteData =
    await PdfDbController.instance.getRemotePdf(id);
    return remoteData;
  }
}
