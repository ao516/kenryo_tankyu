import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:screen_protector/screen_protector.dart';

///ResultPageにデータがしっかり格納されているときに表示されるメイン画面。
///スクリーンショットを禁止するためにstatefulWidgetを使い、結果画面に出てくるそれぞれのWidgetを呼び出している。

class ResultPageMain extends StatefulWidget {
  final Searched searched;
  const ResultPageMain({super.key, required this.searched});

  @override
  State<ResultPageMain> createState() => _ResultPageMainState();
}

class _ResultPageMainState extends State<ResultPageMain> {
  @override
  void initState() {
    super.initState();
    ScreenProtector.preventScreenshotOn();
    ScreenProtector.protectDataLeakageWithColor(Colors.black);
  }

  @override
  void dispose() {
    super.dispose();
    ScreenProtector.preventScreenshotOff();
    ScreenProtector.protectDataLeakageWithColorOff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderForResultPage(searched: widget.searched),
      body: Padding(
        padding:
        const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
        child: Column(children: [
          WorkTitle(searched: widget.searched),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: WorkDetailsTable(searched: widget.searched),
          ),
          PdfChoiceChip(searched: widget.searched),
          DisplayPdf(searched: widget.searched),
        ]),
      ),
    );
  }
}
