import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

import '../providers/search_provider.dart';

class SubCategoryChip extends ConsumerWidget {
  const SubCategoryChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchProvider.notifier);

    ///定義系①:選択されたカテゴリから、そのカテゴリに紐づくサブカテゴリを取得している。
    ///既にカテゴリが選択してあるのはsidebar.dartで確認済み。
    final categoryName = ref.watch(searchProvider).category;
    final int categoryIndex = categoryList.indexOf(categoryName!);
    final List<String> exactSubCategoryList = subCategoryList[categoryIndex];

    ///定義系②:選択されたサブカテゴリを取得している。
    final String? selectedSubCategory = ref.watch(searchProvider).subCategory;

    return Wrap(
      spacing: 8.0,
      children: List<Widget>.generate(exactSubCategoryList.length, (int index) {
        return ChoiceChip(
            label: Text(exactSubCategoryList[index]),
            selected: selectedSubCategory != null
            ? exactSubCategoryList.indexOf(selectedSubCategory!) == index
            : false,
            onSelected: (_) =>
                notifier.selectedSubCategory(exactSubCategoryList[index]));
      }).toList(),
    );
  }
}
