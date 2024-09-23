import 'package:flutter/material.dart';

enum SubjectType {
  japanese,
  math,
  science,
  social,
  english,
  art,
  pe,
  home,
  information,
  tankyu,
  office
}

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
      case SubjectType.art:
        return '芸術';
      case SubjectType.pe:
        return '体育';
      case SubjectType.home:
        return '家庭科';
      case SubjectType.information:
        return '情報';
      case SubjectType.tankyu:
        return '探究';
      case SubjectType.office:
        return '事務';
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
      case SubjectType.art:
        return Colors.yellow;
      case SubjectType.pe:
        return Colors.pink;
      case SubjectType.home:
        return Colors.brown;
      case SubjectType.information:
        return Colors.teal;
      case SubjectType.tankyu:
        return Colors.grey;
      case SubjectType.office:
        return Colors.black;
    }
  }
}

enum GradeInCharge { first, second, third, other,unknown }

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
      case GradeInCharge.unknown:
        return '不明';
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
      case GradeInCharge.unknown:
        return Colors.black;
    }
  }
}

class Teacher {
  Teacher({
    required this.id,
    required this.name,
    required this.nameKana,
    required this.subject,
    required this.grade,
  });
  final String id;
  final String name;
  final String nameKana;
  final SubjectType subject;
  final GradeInCharge grade;
}
