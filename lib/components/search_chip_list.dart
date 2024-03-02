import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SearchChipList extends ConsumerWidget {
  const SearchChipList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Consumer(
          builder: (context, ref,child) {
            final notifier = ref.read(searchProvider.notifier); //呼ぶ側
            final List<String> items = ref.watch(searchProvider.select((state) => state.searchWord!)); //受け取る側
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.pinkAccent),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(items[index], style: const TextStyle(fontSize: 14)),
                      SizedBox(
                        width: 25,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              notifier.deleteKeyWord(index);
                            },
                            icon: const Icon(Icons.clear, size: 16)),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8);
              },
              itemCount: items.length,
            );
          }
        ),
      ),
    );
  }
}
