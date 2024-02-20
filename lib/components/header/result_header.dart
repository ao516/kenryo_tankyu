
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';

class ResultHeader extends StatefulWidget implements PreferredSizeWidget{

  final String searchWord;
  const ResultHeader({Key? key, required this.searchWord}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<ResultHeader> createState() => _ResultHeaderState();
}

class _ResultHeaderState extends State<ResultHeader> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      actions: [Container()], ///drawerを開くボタンを消している
      backgroundColor: Colors.grey.shade200,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Expanded(
          child: SizedBox(
            height: 40,
            child: InkWell(
              onTap: () => context.pop(), //todo 実はpopだと困るんだなぁ。
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16),
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    SearchChipList(),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
