import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SearchHeader extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const SearchHeader({super.key});

  @override
  ConsumerState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends ConsumerState<SearchHeader> {
  @override
  void initState() {
    super.initState();
    ref.read(searchProvider);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(searchProvider.notifier);
    final List<String>? searchWord = ref.watch(searchProvider).searchWord;
    final controller = TextEditingController(text: searchWord?.join(' '));
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        notifier.deleteAllParameters();
        context.pop();
      },
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            height: 40,
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'キーワードを入力',
                  suffixIcon: IconButton(
                    onPressed: () => controller.clear(), //リセット処理
                    icon: const Icon(Icons.clear),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                ),
                onSubmitted: (text) {
                  if (RegExp(r'^\s*$').hasMatch(text)) return; //空白のみの場合は何もしない
                  final List<String> word = text.replaceAll("　", " ").split(" "); //検索ワードを空白で区切る
                  word.removeWhere((content) => content == ' ' || content == '　'); //検索ワードに余分に空白が入っていた場合、消去する todo しっかり機能していないかも。
                  notifier.addKeyWord(word);
                  //検索結果画面に遷移
                  context.pushReplacement('/resultList');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
