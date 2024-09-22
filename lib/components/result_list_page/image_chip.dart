
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../providers/providers.dart';

class WorkImageChip extends StatelessWidget {
  final Searched searched;
  const WorkImageChip({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(children: [
        Stack(
          children: [
            ClipPath(
                clipper: MyCustomClipper1(),
                child: Container(
                  color: Colors.amber,
                  width: 50,
                  height: 50,
                )),
            Image(
              image: AssetImage(categoryImageList[categoryImageList
                  .map((e) => e[1])
                  .toList()
                  .indexOf(searched.category1)][2]),
              width: 25,
              height: 25,
            ),
          ],
        ),
        Stack(
          children: [
            ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                )),
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
        ),
      ]),
    );
  }
}

//カテゴリー１用のクリッパー
class MyCustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 正方形の左上が(0, 0)、右下が(300, 300)
    final path = Path();

    // 右上に移動（開始地点）
    path.moveTo(size.width, 0);
    // 左下まで直線で切り抜く
    path.lineTo(0, size.height);
    // 元の位置まで戻り、範囲を指定
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

//カテゴリー２用のクリッパー
class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 正方形の左上が(0, 0)、右下が(300, 300)
    final path = Path();

    // 右上に移動（開始地点）
    path.moveTo(size.width, 0);
    // 左下まで直線で切り抜く
    path.lineTo(0, size.height);
    // 元の位置まで戻り、範囲を指定
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
