import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import '../providers/search_provider.dart';

class SubCategory extends ConsumerWidget {
  SubCategory(this.number, {super.key});
  int number; //何のカテゴリなのかが入ってくる  ex.) 0 --> 地域・社会

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchProvider.notifier);
    return Column(
      children: [
        ListTile(
          title: const Text('すべて'),
          trailing: const Icon(Icons.navigate_next),
          onTap: () => context.pushReplacement('/resultList'),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Divider(
            height: 1,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){},
                child: ListTile(
                  trailing: const Icon(Icons.navigate_next),
                  title: Text(subCategoryList[number][index]),
                  onTap: () {
                    context.pushReplacement('/resultList', extra: subCategoryList[number][index]);
                    notifier.selectedSubCategory(subCategoryList[number][index]);
                    },
                ),
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
            itemCount: subCategoryList[number].length,
          ),
        ),
      ],
    );
  }
}
