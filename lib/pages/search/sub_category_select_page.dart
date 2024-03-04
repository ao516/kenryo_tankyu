import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/providers/search_provider.dart';

class SubCategorySelectPage extends ConsumerWidget {
  const SubCategorySelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(searchProvider).category;
    return Scaffold(
      appBar: InitialHeader(categoryWord:selectedCategory),
      body: SubCategory(categoryList.indexOf(selectedCategory!)),
    );
  }
}
