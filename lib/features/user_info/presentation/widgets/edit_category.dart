import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/search/domain/export.dart';

enum RadioValue { category1, category2 }

class EditCategory extends StatefulWidget {
  final Searched searched;
  const EditCategory({super.key, required this.searched});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  RadioValue selectedRadio = RadioValue.category1;
  Category selectedCategory = Category.none;
  SubCategory selectedSubCategory = SubCategory.other;

  @override
  Widget build(BuildContext context) {
    final searched = widget.searched;
    return Column(
      children: [
        const Text(
          'どちらのカテゴリを修正しますか',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        _buildRadioList(searched),
        const SizedBox(height: 8),
        _buildCategoryDropdown(),
        const SizedBox(height: 8),
        if (selectedCategory != Category.none) _buildSubCategoryDropdown(),
        const SizedBox(height: 8),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildRadioList(Searched searched) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return _buildRadioListTile(index, searched);
      },
    );
  }

  Widget _buildRadioListTile(int index, Searched searched) {
    final category = index == 0 ? searched.category1 : searched.category2;
    final subCategory =
        index == 0 ? searched.subCategory1 : searched.subCategory2;
    final radioValue = index == 0 ? RadioValue.category1 : RadioValue.category2;

    return RadioListTile<RadioValue>(
      contentPadding: EdgeInsets.zero,
      title: Text('${category.displayName}\n>${subCategory.displayName}'),
      value: radioValue,
      groupValue: selectedRadio,
      onChanged: (RadioValue? value) {
        setState(() {
          selectedRadio = value!;
        });
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField(
      value: selectedCategory,
      onChanged: (Category? value) {
        setState(() {
          selectedCategory = value!;
          selectedSubCategory = SubCategory.other;
        });
      },
      items: Category.values
          .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category.displayName),
              ))
          .toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'カテゴリ',
      ),
    );
  }

  Widget _buildSubCategoryDropdown() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'サブカテゴリ',
        border: OutlineInputBorder(),
        isDense: true,
      ),
      value: selectedSubCategory,
      onChanged: (SubCategory? value) {
        setState(() {
          selectedSubCategory = value!;
        });
      },
      items: selectedCategory.subCategories
          .map((e) => DropdownMenuItem(value: e, child: Text(e.displayName)))
          .toList(),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        print('category: $selectedCategory, subCategory: $selectedSubCategory');
      },
      child: const Text('送信'),
    );
  }
}
