import 'package:freezed_annotation/freezed_annotation.dart';

enum SubCategory {
  //地域・社会
  disaster('災害'),
  sightseeing('観光'),
  administration('市政・行政'),
  law('司法・立法'),
  traffic('交通'),
  communication('場づくり'),
  regionalRevitalization('地域活性化'),

  //人文・歴史
  history('歴史'),
  foreignLanguage('言語'),
  geography('地理'),
  psychology('心理'),
  philosophy('哲学'),
  culture('文化・伝統'),
  words('ことば'),
  literature('映像・文学'),
  subculture('サブカル'),

  //人権・社会福祉
  gender('ジェンダー'),
  childrenRights('子供の権利'),
  poverty('貧困'),
  diversity('多様性'),
  humanRights('人権'),
  difficulties('障がい'),

  //国際
  internationalCooperation('国際協力'),
  internationalIssues('国際問題'),
  compareOtherCountries('海外比較'),

  //ビジネス・経済
  business('ビジネス・お金'),
  marketing('マーケティング'),
  economy('経済'),
  tax('税金'),

  //産業
  agriculture('農業'),
  waterIndustry('水産業'),
  forestry('林業'),
  secondaryIndustry('二次産業'),

  //スポーツ・教育
  sports('スポーツ'),
  preschoolEducation('幼児教育'),
  education('学校教育'),
  study('学習・勉強'),

  //自然環境
  waterResource('水資源'),
  forestResource('森林資源'),
  eco('エコ'),
  environmentProblem('環境問題'),
  plastic('プラスチック'),

  //科学・数学
  mathematics('数学'),
  chemistry('化学'),
  physics('物理'),
  ecology('生物'),
  geographyScience('地学'),

  //テクノロジー・工学
  mechanics('機械工学'),
  ictAndDX('ICT・DX'),
  energy('エネルギー'),
  programming('AI・プログラミング'),
  architecture('建築'),
  app('SNS・ゲーム'),

  //健康・医療
  health('健康'),
  beauty('美容'),
  medicalCare('医療'),
  sleep('睡眠'),
  mentalHealth('メンタルヘルス'),
  welfare('福祉'),

  //デザイン・アート
  art('アート'),
  industryDesign('産業デザイン'),
  music('音楽'),
  fashion('ファッション'),

  //くらし
  food('食・料理'),
  schoolLife('学校生活'),
  book('本・書籍'),
  lifeHack('ライフハック'),
  fragrance('匂い・香り'),
  pet('ペット'),
  home('家庭'),
  
  //その他のカテゴリ
  selfDevelopment('自己啓発'),

  //その他
  other('その他'),
  none('未分類'),
  ;

  const SubCategory(this.displayName);

  final String displayName;
}

class SubCategoryEnumConverter implements JsonConverter<SubCategory, String> {
  const SubCategoryEnumConverter();

  @override
  SubCategory fromJson(String json) {
    final subCategory = SubCategory.values.firstWhere(
      (element) => element.name == json,
      orElse: () => SubCategory.none,
    );
    return subCategory;
  }

  @override
  String toJson(SubCategory object) {
    return object.name;
  }
}