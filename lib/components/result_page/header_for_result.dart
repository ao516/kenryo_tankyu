import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/components/result_page/overlay_dialog.dart';

import '../../providers/providers.dart';

class HeaderForResultPage extends ConsumerWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HeaderForResultPage({required this.searched, super.key});
  final Searched searched;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCached = ref.watch(isCachedProvider);
    final searched = ref.watch(searchedProvider);
    final String cachedText = isCached ? '(キャッシュを表示中)' : '(最新版を表示中)';
    return AppBar(
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: (){
                  ref.invalidate(getFirestoreSearchedProvider(searched));
                },
                child: Text('リロードする$cachedText'),
              ),
              PopupMenuItem(
                onTap: ()=> Navigator.of(context).push(OverlayDialog(searched)),
                child: const Text('情報の変更を提案'),
              ),
              PopupMenuItem(
                onTap: () async {
                  final data = ClipboardData(text: _setClipboard(searched));
                  await Clipboard.setData(data);
                },
                child: const Text('情報をクリップボードにコピー'),
              ),
            ];
          },
        ),
      ],
    );
  }

  String _setClipboard(Searched searched) {
    final String text =
        '『${searched.title}』\n${searched.year}年度入学／${searched.course}\n名前：${searched.author}\n'
        '---------\nカテゴリ1：${searched.category1}>${searched.subCategory1}\n'
        'カテゴリ2：${searched.category2}>${searched.subCategory2}';
    return text;
  }
}
