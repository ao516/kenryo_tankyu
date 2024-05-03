import 'package:flutter/material.dart';

class ShowTeacherPdfPage extends StatelessWidget {
  ShowTeacherPdfPage({required this.teacherName,super.key});

  String teacherName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Center(child: Text(teacherName)));
  }
}
