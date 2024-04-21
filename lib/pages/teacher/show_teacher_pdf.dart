import 'package:flutter/material.dart';

class ShowTeacherPdf extends StatelessWidget {
  ShowTeacherPdf(this.subjectName,{super.key});

  String subjectName;
  @override
  Widget build(BuildContext context) {
    return Text(subjectName);
  }
}
