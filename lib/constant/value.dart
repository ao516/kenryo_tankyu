const List<int> yearList = [2018, 2019, 2020, 2021, 2022];
// const List<String> yearLists = ['2018', '2019', '2020', '2021', '2022'];
const List<String> departmentList = ['普通科', '探究科'];
const List<String> eventNameList = ['信州学', '個人探究'];
const List<String> categoryList = [
  '社会・地域',
  '人文・歴史',
  '人権・ジェンダー',
  '国際',
  'ビジネス・経済',
  '一次産業',
  'スポーツ・教育',
  '自然環境',
  '科学・数学',
  'テクノロジー・工学',
  '健康・医療',
  'デザイン・アート',
  'くらし',
  'その他',
];



const List<List<String>> subCategoryList = [
  ['防災', '観光', '市政', '政治'],
  ['歴史', '言語', '地理', '心理', '哲学'],
  ['ジェンダー', '子供の権利', '貧困'],
  ['国際協力', '海外問題'],
  ['ビジネス', 'マーケティング', '経済', 'エシカル消費'],
  ['農業', '水産業', '林業'],
  ['スポーツ', '幼児教育', '教育'],
  ['水資源', '森資源', '生物', '地学', 'エシカル'],
  ['数学', '化学', '物理'],
  ['コンピューター', 'ロボット', '機械工学', 'ＩＣＴ'],
  ['健康', '美容', '医療'],
  ['アート', 'デザイン', '音楽'],
  ['食', '学校生活', '図書'],
];

const List<List<String>> categoryImageList = [
  ['社会・地域','社会・地域', 'assets/images/category/society.png'],
  ['人文・歴史','人文・歴史', 'assets/images/category/history.png'],
  ['人権\nジェンダー','人権・ジェンダー', 'assets/images/category/right.png'],
  ['国際', '国際','assets/images/category/global.png'],
  ['ビジネス\n経済','ビジネス・経済', 'assets/images/category/business.png'],
  ['一次産業','一次産業', 'assets/images/category/agriculture.png'],
  ['スポーツ\n教育','スポーツ・教育', 'assets/images/category/school.png'],
  ['自然環境', '自然環境','assets/images/category/environment.png'],
  ['科学・数学', '科学・数学','assets/images/category/science.png'],
  ['テクノロジー\n工学','テクノロジー・工学', 'assets/images/category/technology.png'],
  ['健康・医療','健康・医療', 'assets/images/category/health.png'],
  ['デザイン\nアート','デザイン・アート', 'assets/images/category/art.png'],
  ['くらし', 'くらし','assets/images/category/life.png'],
  ['その他', 'その他', 'assets/images/category/other.png'],
];

const List<String> changeInfoList = [
  'カテゴリの分類が不適切',
  '作品の情報が間違っている',
  'PDFが閲覧できない',
  'その他',
];

const List<String> pdfChoiceList = [
  'スライド',
  'レポート',
  'ポスター',
  '論文',
];

const List<String> krgpYearList = [
  '2019',
  '2020',
  '2021',
  '2022',
  '2023',
];

const List<List<String>> krgp2022List = [
  ['大賞'],
  ['優秀賞'],
  ['Best English Presenter'],
  ['奨励賞'],
  ['奨励賞'],
];

const List<int> enterYears = [2022, 2023, 2024];
enum SortType { newOrder, oldOrder, likeOrder }
extension SortTypeExtension on SortType {
  String get name {
    switch (this) {
      case SortType.newOrder:
        return '新しい順';
      case SortType.oldOrder:
        return '古い順';
      case SortType.likeOrder:
        return 'いいね順';
    }
  }
}

enum SortTypeForTeacher {nameAscendingOrder,nameDescendingOrder,subjectOrder,gradeOrder}
extension SortTypeForTeacherExtension on SortTypeForTeacher {
  String get name {
    switch (this) {
      case SortTypeForTeacher.nameAscendingOrder:
        return '50音順';
      case SortTypeForTeacher.nameDescendingOrder:
        return '逆50音順';
      case SortTypeForTeacher.subjectOrder:
        return '教科順';
      case SortTypeForTeacher.gradeOrder:
        return '学年順';
    }
  }
}