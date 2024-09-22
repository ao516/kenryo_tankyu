import 'package:flutter/material.dart';

enum SubjectType { japanese, math, science, social, english, pe, office, other }

extension SubjectTypeExtension on SubjectType {
  String get name {
    switch (this) {
      case SubjectType.japanese:
        return '国語';
      case SubjectType.math:
        return '数学';
      case SubjectType.science:
        return '理科';
      case SubjectType.social:
        return '社会';
      case SubjectType.english:
        return '英語';
      case SubjectType.pe:
        return '体育';
      case SubjectType.office:
        return '事務';
      case SubjectType.other:
        return 'その他';
    }
  }

  Color get color {
    switch (this) {
      case SubjectType.japanese:
        return Colors.red;
      case SubjectType.math:
        return Colors.blue;
      case SubjectType.science:
        return Colors.green;
      case SubjectType.social:
        return Colors.orange;
      case SubjectType.english:
        return Colors.purple;
      case SubjectType.pe:
        return Colors.pink;
      case SubjectType.office:
        return Colors.brown;
      case SubjectType.other:
        return Colors.grey;
    }
  }
}

enum GradeInCharge { first, second, third, other }

extension GradeInChargeExtension on GradeInCharge {
  String get name {
    switch (this) {
      case GradeInCharge.first:
        return '1年生';
      case GradeInCharge.second:
        return '2年生';
      case GradeInCharge.third:
        return '3年生';
      case GradeInCharge.other:
        return 'その他';
    }
  }
  Color get color {
    switch (this) {
      case GradeInCharge.first:
        return Colors.red;
      case GradeInCharge.second:
        return Colors.blue;
      case GradeInCharge.third:
        return Colors.green;
      case GradeInCharge.other:
        return Colors.grey;
    }
  }
}


class Teacher {
  Teacher({
    required this.name,
    required this.nameKana,
    required this.nameEn,
    required this.subject,
    required this.grade,
  });

  final String name;
  final String nameKana;
  final String nameEn;
  final SubjectType subject;
  final GradeInCharge grade;
}
