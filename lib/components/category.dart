import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

import '../providers/search_provider.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(searchProvider.notifier);
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: categoryImageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                context.push('/subCategory');
                notifier.selectedCategory(categoryList[index]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryImageList[index][0],
                    style: const TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      categoryImageList[index][2],
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
