import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/pages/teacher/teacher_provider.dart';

class ShowTeacherPdfPage extends ConsumerWidget {
  const ShowTeacherPdfPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedTeacher = ref.watch(selectedTeacherProvider);
    final teacherPdfPath = ref.watch(teacherPdfPathProvider);
    final pdfData = ref.watch(teacherPdfProvider(teacherPdfPath));

    return Scaffold(appBar: AppBar(),body: Column(
      children: [
        pdfData.when(
          data: (data) => data == null
              ? const Text('データがありません')
              : SizedBox(height: 300,child: PDFView(pdfData: data,enableSwipe: true,autoSpacing: false,pageFling: true,pageSnap: true,)),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),

        Text(selectedTeacher),
      ],
    ));
  }
}
