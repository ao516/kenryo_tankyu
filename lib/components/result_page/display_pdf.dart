import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../db/pdf_db.dart';



class DisplayPdf extends ConsumerWidget {
  final Searched searched;
  const DisplayPdf({super.key, required this.searched});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Consumer(builder: (context, ref, child) {
            final nowWatchingPdf = ref.watch(stringProvider);
            return FutureBuilder<Uint8List?>(
              future: _getPdf(nowWatchingPdf),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.data == null) {
                    return const Text('データがありません。');
                  }
                  return Stack(
                    children: [
                      PDFView(
                        pdfData: snapshot.data!,
                        enableSwipe: true,
                        autoSpacing: false,
                        pageFling: false,
                        pageSnap: false,
                      ),
                      Consumer(builder: (context, ref, child) {
                        final showFullScreen =
                            ref.watch(showFullScreenButtonProvider);
                        final notifier =
                            ref.read(showFullScreenButtonProvider.notifier);
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            notifier.state = !showFullScreen;
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        );
                      })
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, child) {
                final showFullScreen = ref.watch(showFullScreenButtonProvider);
                final isFullScreen = ref.watch(isFullScreenProvider);
                return GestureDetector(
                  onTap: () => ref.read(isFullScreenProvider.notifier).state =
                      !isFullScreen,
                  child: AnimatedOpacity(
                    opacity: showFullScreen ? 1 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                            size: 19,
                          ),
                        )),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
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
