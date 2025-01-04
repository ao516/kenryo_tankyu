const String version = '1.0.0';
const bool developer_mode = false;
const String appName = '探究アーカイブ';
const String appIcon = 'assets/images/app_icon.png';

final termsOfServiceLink = Uri.parse('https://sites.google.com/view/tankyu-terms-of-service');
final privacyPolicyLink = Uri.parse('https://sites.google.com/view/tankyu-privacy-policy');
final contactFormLink = Uri.parse('https://forms.gle/xUXX88MJ5fLsVtAk9');



enum ChangeInfoFromUserType {
  editCategory(displayName: 'カテゴリの分類が不適切'),
  editWorkInfo(displayName: '作品の情報が間違っている'),
  cannotViewPdf(displayName: 'PDFが閲覧できない'),
  otherReason(displayName: 'その他'),
  ;
  const ChangeInfoFromUserType({required this.displayName});
  final String displayName;
}



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