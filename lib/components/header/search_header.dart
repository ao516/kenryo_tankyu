import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SearchHeader extends ConsumerStatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const SearchHeader({super.key});

  @override
  SearchHeaderState createState() => SearchHeaderState();
}

class SearchHeaderState extends ConsumerState<SearchHeader> {

  @override
  void initState() {
    super.initState();
    ref.read(searchProvider);
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(searchProvider.notifier);
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
              decoration: InputDecoration(
                hintText: 'キーワードを入力',
                suffixIcon: IconButton(
                  onPressed: () => _controller.clear(), //リセット処理
                  icon: const Icon(Icons.clear),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (text) {
                notifier.addKeyWord(text);
                context.pushReplacement('/resultList', extra: text);
              },
            ),
          ),
        ),
      ),
    );
  }
}
