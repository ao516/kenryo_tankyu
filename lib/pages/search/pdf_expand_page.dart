import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class PdfExpandPage extends StatelessWidget {
  final Searched searched;
  const PdfExpandPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderForResultPage(),
      body: Column(
        children: [
          PdfChoiceChip(searched: searched),
          DisplayPdf(searched: searched),
        ]
      )
    );
  }
}
