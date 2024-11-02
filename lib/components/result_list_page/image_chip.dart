import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/models/models.dart';

class WorkImageChip extends StatelessWidget {
  final Searched searched;
  const WorkImageChip({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return searched.category2.name != 'none' ? _twoCategoryChip() : _oneCategoryChip();
  }

  Widget _twoCategoryChip() {
    return Stack(
      children: [
        SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(
                'assets/images/categories/${searched.category1.name}.png')),
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
                  'assets/images/categories/${searched.category2.name}.png')),
        ),
      ],
    );
  }

  _oneCategoryChip() {
    return SizedBox(
      height: 40,
      width: 40,
      child: Image.asset(
          'assets/images/categories/${searched.category1.name}.png'),
    );
  }
}
