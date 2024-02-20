import 'package:flutter/material.dart';

class SearchChipList extends StatelessWidget {
  const SearchChipList({super.key});

  static final List<String> _items = <String>['aa', 'ssa', 'あああああああああああああああああ'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListView.separated(
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
                  Text(_items[index], style: const TextStyle(fontSize: 14)),
                  SizedBox(
                    width: 25,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {}, //TODO on pressed
                        icon: const Icon(Icons.clear, size: 16)),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8);
          },
          itemCount: _items.length,
        ),
      ),
    );
  }
}
