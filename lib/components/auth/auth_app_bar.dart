import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(appIcon, width: 40),
      bottom: PreferredSize(
        child:LinearProgressIndicator(value: 0.33),
        preferredSize: Size.fromHeight(3.0),
      ),
    );
  }
}
