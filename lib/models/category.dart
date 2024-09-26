import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenryo_tankyu/models/models.dart';

enum Category {
  society(
    displayName: '社会・地域',
    nameForExplore: '社会・地域',
    color: Color(0xFFd73c00),
    subCategories: [
      SubCategory.disaster,
      SubCategory.sightseeing,
      SubCategory.administration,
      SubCategory.traffic,
      SubCategory.communication,
      SubCategory.regionalRevitalization,
      SubCategory.other,
    ],
  ),
  history(
    displayName: '人文・歴史',
    nameForExplore: '人文・歴史',
    color: Color(0xFFd68d00),
    subCategories: [
      SubCategory.history,
      SubCategory.foreignLanguage,
      SubCategory.geography,
      SubCategory.psychology,
      SubCategory.philosophy,
      SubCategory.cultureAndTradition,
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
      SubCategory.childrenRights,
      SubCategory.poverty,
      SubCategory.diversity,
      SubCategory.humanRights,
      SubCategory.difficulties,
      SubCategory.other,
    ],
  ),
  international(
    displayName: '国際',
    nameForExplore: '国際',
    color: Color(0xFF1e00d7),
    subCategories: [
      SubCategory.internationalCooperation,
      SubCategory.internationalIssues,
      SubCategory.compareOtherCountries,
      SubCategory.other,
    ],
  ),
  business(
    displayName: 'ビジネス・経済',
    nameForExplore: 'ビジネス\n経済',
    color: Color(0xFF00d89c),
    subCategories: [
      SubCategory.businessAndMoney,
      SubCategory.marketing,
      SubCategory.economy,
      SubCategory.tax,
      SubCategory.other,
    ],
  ),
  industry(
    displayName: '一次産業',
    nameForExplore: '一次産業',
    color: Color(0xFFb1d800),
    subCategories: [
      SubCategory.agriculture,
      SubCategory.waterIndustry,
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
      SubCategory.earlyChildhoodEducation,
      SubCategory.education,
      SubCategory.study,
      SubCategory.other,
    ],
  ),
  environment(
    displayName: '自然環境',
    nameForExplore: '自然環境',
    color: Color(0xFF03d929),
    subCategories: [
      SubCategory.waterResource,
      SubCategory.forestResource,
      SubCategory.eco,
      SubCategory.plastic,
      SubCategory.other,
    ],
  ),
  science(
    displayName: '科学・数学',
    nameForExplore: '科学・数学',
    color: Color(0xFF006fd8),
    subCategories: [
      SubCategory.mathematics,
      SubCategory.chemistry,
      SubCategory.physics,
      SubCategory.ecology,
      SubCategory.geographyScience,
      SubCategory.other,
    ],
  ),
  technology(
    displayName: 'テクノロジー・工学',
    nameForExplore: 'テクノロジー\n工学',
    color: Color(0xFF15d8cd),
    subCategories: [
      SubCategory.mechanics,
      SubCategory.ictAndDX,
      SubCategory.aiAndProgramming,
      SubCategory.energy,
      SubCategory.architecture,
      SubCategory.socialMediaAndGame,
      SubCategory.other,
    ],
  ),
  health(
    displayName: '健康・医療',
    nameForExplore: '健康・医療',
    color: Color(0xFFd80089),
    subCategories: [
      SubCategory.health,
      SubCategory.beauty,
      SubCategory.medicalCare,
      SubCategory.sleep,
      SubCategory.mentalHealth,
      SubCategory.welfare,
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
      SubCategory.home,
      SubCategory.other,
    ],
  ),
  other(
    displayName: 'その他',
    nameForExplore: 'その他',
    color: Colors.grey,
    subCategories: [SubCategory.other],
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
    debugPrint('CategoryEnumConverter fromJson: $category');
    return category;
  }

  @override
  String toJson(Category object) {
    debugPrint('CategoryEnumConverter toJson: $object');
    return object.name;
  }
}