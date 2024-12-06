import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenryo_tankyu/models/models.dart';

enum Category {
  society(
      displayName: '地域',
      nameForExplore: '地域',
      color: Color(0xFFd73c00),
      subCategories: [
        SubCategory.disasterPrevention,
        SubCategory.sightseeing,
        SubCategory.traffic,
        SubCategory.communication,
        SubCategory.regionalRevitalization,
        SubCategory.other,
      ]),
  history(
    displayName: '人文・歴史',
    nameForExplore: '人文・歴史',
    color: Color(0xFFd68d00),
    subCategories: [
      SubCategory.history,
      SubCategory.foreignLanguage,
      SubCategory.religion,
      SubCategory.psychology,
      SubCategory.philosophy,
      SubCategory.culture,
      SubCategory.literature,
      SubCategory.subculture,
      SubCategory.words,
      SubCategory.other,
    ],
  ),
  right(
    displayName: '人権・社会福祉',
    nameForExplore: '人権\n社会福祉',
    color: Color(0xFF492456),
    subCategories: [
      SubCategory.gender,
      SubCategory.rights,
      SubCategory.poverty,
      SubCategory.peace,
      SubCategory.diversity,
      SubCategory.difficulties,
      SubCategory.nursing,
      SubCategory.other,
    ],
  ),
  international(
    displayName: '国際',
    nameForExplore: '国際',
    color: Color(0xFF1e00d7),
    subCategories: [
      SubCategory.international,
      SubCategory.compareOtherCountries,
      SubCategory.other,
    ],
  ),
  business(
    displayName: '社会・経済',
    nameForExplore: '社会\n経済',
    color: Color(0xFF00d89c),
    subCategories: [
      SubCategory.marketing,
      SubCategory.business,
      SubCategory.administration,
      SubCategory.law,
      SubCategory.other,
    ],
  ),
  industry(
    displayName: '産業',
    nameForExplore: '産業',
    color: Color(0xFFb1d800),
    subCategories: [
      SubCategory.agriculture,
      SubCategory.aquaCulture,
      SubCategory.forestry,
      SubCategory.secondaryIndustry,
      SubCategory.other,
    ],
  ),
  education(
    displayName: 'スポーツ・教育',
    nameForExplore: 'スポーツ\n教育',
    color: Color(0xFFd80040),
    subCategories: [
      SubCategory.sports,
      SubCategory.childCare,
      SubCategory.education,
      SubCategory.studies,
      SubCategory.other,
    ],
  ),
  environment(
    displayName: '環境問題',
    nameForExplore: '環境問題',
    color: Color(0xFF03d929),
    subCategories: [
      SubCategory.ecosystem,
      SubCategory.climateChange,
      SubCategory.pollution,
      SubCategory.recycle,
      SubCategory.otherProblem,
      SubCategory.other,
    ],
  ),
  science(
    displayName: '数学・理科',
    nameForExplore: '数学\n理科',
    color: Color(0xFF006fd8),
    subCategories: [
      SubCategory.mathematics,
      SubCategory.physics,
      SubCategory.chemistry,
      SubCategory.ecology,
      SubCategory.geology,
      SubCategory.other,
    ],
  ),
  technology(
    displayName: 'テクノロジー・工学',
    nameForExplore: 'テクノロジー\n工学',
    color: Color(0xFF15d8cd),
    subCategories: [
      SubCategory.app,
      SubCategory.architecture,
      SubCategory.manufacturing,
      SubCategory.ictAndAI,
      SubCategory.energy,
      SubCategory.other,
    ],
  ),
  health(
    displayName: '健康・医療',
    nameForExplore: '健康\n医療',
    color: Color(0xFFd80089),
    subCategories: [
      SubCategory.health,
      SubCategory.beauty,
      SubCategory.medicalCare,
      SubCategory.sleep,
      SubCategory.mentalHealth,
      SubCategory.other,
    ],
  ),
  art(
    displayName: 'デザイン・アート',
    nameForExplore: 'デザイン\nアート',
    color: Color(0xFFda5e00),
    subCategories: [
      SubCategory.art,
      SubCategory.industryDesign,
      SubCategory.music,
      SubCategory.fashion,
      SubCategory.other,
    ],
  ),
  life(
    displayName: 'くらし',
    nameForExplore: 'くらし',
    color: Color(0xFFd4d708),
    subCategories: [
      SubCategory.food,
      SubCategory.schoolLife,
      SubCategory.book,
      SubCategory.lifeHack,
      SubCategory.fragrance,
      SubCategory.pet,
      SubCategory.love,
      SubCategory.other,
    ],
  ),
  other(
    displayName: 'その他',
    nameForExplore: 'その他',
    color: Colors.grey,
    subCategories: [
      SubCategory.enlightenment,
      SubCategory.other,
    ],
  ),
  none(
    displayName: '未設定',
    nameForExplore: '未設定',
    color: Colors.black,
    subCategories: [SubCategory.none],
  );

  final String displayName;
  final String nameForExplore;
  final Color color;
  final List<SubCategory> subCategories;

  const Category({
    required this.displayName,
    required this.nameForExplore,
    required this.color,
    required this.subCategories,
  });
}

class CategoryEnumConverter implements JsonConverter<Category, String> {
  const CategoryEnumConverter();

  @override
  Category fromJson(String json) {
    final Category category = Category.values.firstWhere(
      (element) => element.name == json,
      orElse: () => Category.none,
    );
    return category;
  }

  @override
  String toJson(Category object) {
    return object.name;
  }
}
