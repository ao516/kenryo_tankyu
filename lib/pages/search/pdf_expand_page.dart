import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class PdfExpandPage extends ConsumerWidget {
  final Searched searched;
  const PdfExpandPage({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullScreen = ref.watch(isFullScreenProvider);
     return PopScope(
      canPop: !isFullScreen,
      onPopInvoked: (bool isPop) {
        ref.read(isFullScreenProvider.notifier).state = false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: PdfChoiceChip(searched: searched),
          ),
          body: Column(children: [
            DisplayPdf(searched: searched),
          ])),
    );
  }
}
