import 'package:kenryo_tankyu/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final List<String> _items = ['鳥', 'わんこそば'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchHeader(),
      body: Column(
        children: [
          ListTile(
            title: const Text('またはカテゴリから選ぶ'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => context.go('/explore'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              child: Row(

                children: [
                  Icon(Icons.history),
                  Text('閲覧履歴',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: const Icon(Icons.navigate_next),
                title: Text(_items[index]),
                onTap: () => context.push('/resultList', extra: _items[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              );
            },
            itemCount: _items.length,
          ))
        ],
      ),
    );
  }
}
