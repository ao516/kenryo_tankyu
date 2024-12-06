import 'package:freezed_annotation/freezed_annotation.dart';

enum SubCategory {
  // 地域
  disasterPrevention('防災'),
  sightseeing('観光'),
  traffic('交通'),
  communication('場づくり'),
  regionalRevitalization('地域おこし'),

  // 人文・歴史
  history('歴史'),
  foreignLanguage('外国語'),
  religion('宗教'),
  psychology('心理・意識'),
  philosophy('哲学'),
  culture('文化・伝統'),
  literature('映像・文学'),
  subculture('サブカル'),
  words('ことば'),

  // 人権・社会福祉
  gender('ジェンダー'),
  rights('人権'),
  poverty('貧困'),
  peace('平和'),
  diversity('多様性'),
  difficulties('障がい'),
  nursing('介護'),

  // 国際
  international('国際関連'),
  compareOtherCountries('海外比較'),

  // 社会・経済
  marketing('商学'),
  business('経済'),
  administration('市政・行政'),
  law('司法・立法'),

  // 産業
  agriculture('農業'),
  aquaCulture('水産業'),
  forestry('林業'),
  secondaryIndustry('二次産業'),

  // スポーツ・教育
  sports('スポーツ'),
  childCare('保育'),
  education('教育'),
  studies('学習・勉強'),

  // 環境問題
  ecosystem('生態系'),
  climateChange('気候変動'),
  pollution('環境汚染'),
  recycle('再利用・リサイクル'),
  otherProblem('その他環境問題'),

  // 数学・理科
  mathematics('数学'),
  chemistry('化学'),
  physics('物理'),
  ecology('生物'),
  geology('地学'),

  // テクノロジー・工学
  app('SNS・ゲーム'),
  architecture('建築'),
  manufacturing('ものづくり'),
  ictAndAI('ICT・AI'),
  energy('エネルギー'),

  // 健康・医療
  health('健康'),
  beauty('美容'),
  medicalCare('医療'),
  sleep('睡眠'),
  mentalHealth('こころの健康'),

  // デザイン・アート
  art('アート'),
  industryDesign('産業デザイン'),
  music('音楽・音'),
  fashion('ファッション'),

  // くらし
  food('食・料理'),
  schoolLife('学校生活'),
  book('本・書籍'),
  lifeHack('ライフハック'),
  fragrance('匂い・香り'),
  pet('ペット'),
  love('恋愛'),

  // その他
  enlightenment('啓発・啓蒙'),

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
