
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';

import '../../providers/search_provider.dart';

class ResultHeader extends ConsumerStatefulWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const ResultHeader({super.key});

  @override
  ResultHeaderState createState() => ResultHeaderState();
}

class ResultHeaderState extends ConsumerState<ResultHeader> {
  @override
  void initState() {
    super.initState();
    ref.read(searchProvider);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(searchProvider.notifier);
    final data = ref.watch(searchProvider);
    return  PopScope(
      onPopInvoked: (didPop)=> notifier.deleteParameter(),
      child: AppBar(
        actions: [Container()], ///drawerを開くボタンを消している
        backgroundColor: Colors.grey.shade200,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Expanded(
            child: SizedBox(
              height: 40,
              child: InkWell(
                onTap: () => context.pushReplacement('/search'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.search),
                      const SizedBox(width: 8),
                      data.searchWord != null ?
                      const SearchChipList(): const Text('キーワードを検索', style: TextStyle(fontSize: 16, color: Colors.black54)),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
