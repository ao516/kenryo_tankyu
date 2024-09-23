
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/models/models.dart';

import '../../constant/constant.dart';

class WorkImageChip extends StatelessWidget {
  final Searched searched;
  const WorkImageChip({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(categoryImageList[categoryImageList
              .map((e) => e[1])
              .toList()
              .indexOf(searched.category1)][2]),
          width: 25,
          height: 25,
        ),
        SizedBox(
            height: 50,
            width: 50,
            child: Transform.rotate(
                angle: 135 * 3.14 / 180, child: const Divider())),
        Positioned(
          top: 25,
          left: 25,
          child: Image(
            image: AssetImage(categoryImageList[categoryImageList
                .map((e) => e[1])
                .toList()
                .indexOf(searched.category2)][2]),
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}