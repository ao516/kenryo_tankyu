import 'package:flutter/material.dart';

class TestForCoji extends StatelessWidget {
  const TestForCoji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text('wewewewlkonhjnhklugbhkuigikyhugbh'),
            ),
          ),
          Expanded(
              child: Icon(
            Icons.content_copy_sharp,
            size: 55,
            color: Colors.cyan,
          ))
        ],
      ),
    );
  }
}
