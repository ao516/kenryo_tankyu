import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../providers/providers.dart';

class HeaderForResultPage extends ConsumerWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HeaderForResultPage({required this.searched, super.key});
  final Searched searched;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPdf = ref.watch(intProvider);
    final selectedPdfPath = ref.watch(stringProvider);
    String pdfName = selectedPdf == 0
        ? 'スライド'
        : selectedPdf == 1
            ? 'レポート'
            : selectedPdf == 2
                ? 'ポスター'
                : '論文';
    return AppBar(
      actions: [
        PopupMenuButton(
            icon: const Icon(Icons.download),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: _downLoadPdf(context,selectedPdfPath),
                  child: Text('「$pdfName」のみをダウンロード'),
                ),
                const PopupMenuItem(
                  child: Text('すべてダウンロード'),
                ),
              ];
            }),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('情報の変更を提案'),
              ),
              const PopupMenuItem(
                child: Text('情報をクリップボードにコピー'),
              ),
            ];
          },
        ),
      ],
    );
  }

  _downLoadPdf(BuildContext context,String selectedPdfPath) async {
    final ref = FirebaseStorage.instance.ref().child('test/$selectedPdfPath.pdf');
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath =
        '${appDocDir.absolute}/${searched.title}.pdf';
    final file = File(filePath);
    final downloadTask = ref.writeToFile(file);
    downloadTask.snapshotEvents.listen((taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          const snackBar = SnackBar(
              content: Text('データ保存中です。'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.success:
          const snackBar = SnackBar(
              content: Text('保存完了しました。'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          // TODO: Handle this case.
          break;
      }
    });
  }
}
