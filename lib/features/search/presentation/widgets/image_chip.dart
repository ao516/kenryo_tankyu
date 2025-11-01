import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';
import 'package:kenryo_tankyu/features/research_work/domain/models/models.dart';
import 'package:kenryo_tankyu/features/settings/data/repositories/settings_db.dart';

class WorkImageChip extends StatelessWidget {
  final Searched searched;
  final WidgetRef ref;
  const WorkImageChip({super.key, required this.searched, required this.ref});

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    return searched.category2 != Category.none ? _twoCategoryChip(themeMode) : _oneCategoryChip(themeMode);
  }

  Widget _twoCategoryChip(ThemeMode themeMode) {
    return Stack(
      children: [
        SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(_filePathName(searched.category1, themeMode))),
        SizedBox(
            height: 50,
            width: 50,
            child: Transform.rotate(
                angle: 135 * 3.14 / 180, child: const Divider())),
        Positioned(
          top: 25,
          left: 25,
          child: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                  _filePathName(searched.category2, themeMode))),
        ),
      ],
    );
  }

  _oneCategoryChip(ThemeMode themeMode) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Image.asset(
          _filePathName(searched.category1, themeMode)),
    );
  }

  String _filePathName(Category category, ThemeMode themeMode) {
    if (category == Category.other) {
      return themeMode == ThemeMode.dark
          ? 'assets/images/categories/other_for_dark.png'
          : 'assets/images/categories/other_for_light.png';
    }
    return 'assets/images/categories/${category.name}.png';
  }
}
