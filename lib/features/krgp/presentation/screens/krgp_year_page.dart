import 'package:flutter/material.dart';

class KrgpYearPage extends StatelessWidget {
  final String year;
  const KrgpYearPage({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('KRGP $year'),
    );
  }
}
