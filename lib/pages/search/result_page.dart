import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/pages/pages.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

///ResultPageにデータがしっかり格納されているときに表示されるメイン画面。
///スクリーンショットを禁止するためにstatefulWidgetを使い、結果画面に出てくるそれぞれのWidgetを呼び出している。

//全画面か詳細画面かどうかを管理するprovider。IndexedStackに使用
final isFullScreenProvider = StateProvider.autoDispose<bool>((ref) => false);

class ResultPage extends ConsumerStatefulWidget {
  final Searched beforeSearched;
  const ResultPage({super.key, required this.beforeSearched});

  @override
  ConsumerState<ResultPage> createState() => _ResultPageMainState();
}

class _ResultPageMainState extends ConsumerState<ResultPage> {
  @override
  void initState() {
    super.initState();
    // ScreenProtector.preventScreenshotOn();
    // ScreenProtector.protectDataLeakageWithColor(Colors.black);
  }

  @override
  void dispose() {
    super.dispose();
    // ScreenProtector.preventScreenshotOff();
    // ScreenProtector.protectDataLeakageWithColorOff();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(isFullScreenProvider) ? 1 : 0; //全画面表示かどうか
    final beforeSearched = ref.watch(getFirestoreSearchedProvider(widget.beforeSearched));

    return beforeSearched.when(
      data: (searched) {

        if (searched == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('データを取得できませんでした。')),
          );
        } else {
          return IndexedStack(
            index: currentIndex,
            children: [
              //詳細画面
              Scaffold(
                appBar: HeaderForResultPage(searched: searched),
                body: Padding(
                  padding:
                  const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Column(children: [
                    WorkTitle(searched: searched),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: WorkDetailsTable(searched: searched),
                    ),
                    PdfChoiceChip(searched: searched),
                    DisplayPdf(searched: searched),
                  ]),
                ),
              ),

              //全画面表示
              PdfExpandPage(searched: searched),
            ],
          );
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(error.toString())),
      ),

    );
  }
}
