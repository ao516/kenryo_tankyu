import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Uint8List? _documentBytes;
  // Create a storage reference from our app
  final pathReference = FirebaseStorage.instance.ref().child('sample.pdf');

  @override
  void initState() {
    getPdfBytes();
    super.initState();
  }

  void getPdfBytes() async {
    try {
      const oneMegabyte = 1024 * 1024;
      _documentBytes = await pathReference.getData(oneMegabyte);
      setState(() {});
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const Center(child: CircularProgressIndicator());
    if (_documentBytes != null) {
      child = SfPdfViewer.memory(
        _documentBytes!,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('練習'),
        actions: [
          IconButton(
            onPressed: () async {
              await _download();
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: child,
    );
  }

  Future _download() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.path}/tankyu_archive/sample.pdf";
    debugPrint(filePath);
    final file = File(filePath);

    final downloadTask = pathReference.writeToFile(file);
    downloadTask.snapshotEvents.listen((taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          const SnackBar(content: Text('ダウンロード中です'));
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.success:
          // TODO: Handle this case.
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
