import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/models/models.dart';
import '../../providers/providers.dart';

class SubCategorySelectPage extends ConsumerWidget {
  const SubCategorySelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Category selectedCategory = ref.watch(searchProvider).category;
    return Scaffold(
      appBar: InitialHeader(categoryWord:selectedCategory.displayName),
      body: const DisplaySubCategoryList(),
    );
  }
}
