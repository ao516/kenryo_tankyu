import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 200, //todo サイズを直で指定してるのはちょっとなぁ
        height: 600,
        child: Drawer(
          child: SafeArea(child: Text('aa')),
        ),
      ),
    );
  }
}
