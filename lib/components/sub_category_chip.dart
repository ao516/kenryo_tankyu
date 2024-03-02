import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/constant/constant.dart';

class SubCategoryChip extends StatelessWidget {
  final _value = 3;

  const SubCategoryChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List<Widget>.generate(categoryList.length, (int index) {
        return ChoiceChip(
            label: Text(categoryList[index][1]), selected: _value == index);
      }).toList(),
    );
  }
}
