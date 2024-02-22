import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatefulWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
          height: 40,
          child: Container(
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextField(
              autofocus: true,
              controller: _controller,
              decoration:  InputDecoration(
                hintText: 'キーワードを入力',
                suffixIcon: IconButton(
                  onPressed: () => _controller.clear(), //リセット処理
                  icon: const Icon(Icons.clear),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (text) => context.pushReplacement('/resultList',extra: text),
            ),
          ),
        ),
      ),
    );
  }
}