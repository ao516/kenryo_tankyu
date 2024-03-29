import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class WorkTitle extends StatelessWidget {
  final Searched searched;
  const WorkTitle({super.key,required this.searched});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(
          width: 20,
          height: 50,
          child: Container(
            color: searched.year % 3 == 0
                ? Colors.red
                : searched.year % 3 == 1
                ? Colors.green
                : Colors.blue,
          )
        ),
        Container(
          color: searched.year % 3 == 0
              ? Colors.red
              : searched.year % 3 == 1
              ? Colors.green
              : Colors.blue,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            searched.title,
            softWrap: true,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(width: 4),
        FavoriteForResultPage(
            searched: searched),
      ],
    );
  }
}
