import 'package:flutter/material.dart';

class HeaderForResultPage extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const HeaderForResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton(icon:const Icon(Icons.download),itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: Text('「スライド」のみをダウンロード'), //TODO: このテキストを変更する
            ),
            const PopupMenuItem(
              child: Text('すべてダウンロード'),
            ),
          ];
        }),
        PopupMenuButton(itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: Text('情報の変更を提案'),
            ),
            const PopupMenuItem(
              child: Text('情報をクリップボードにコピー'),
            ),
          ];
        },),
      ],
    );
  }
}
