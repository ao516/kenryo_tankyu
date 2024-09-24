import 'package:kenryo_tankyu/models/models.dart';

 Searched testSearchedValue1 = const Searched(
  documentID: 22202360,
  category1: Category.society,
  category2: Category.art,
  subCategory1:SubCategory.beauty,
  subCategory2: SubCategory.none,
  year: 2022,
  eventName: EventName.individualTankyu,
  course: Course.tankyu,
  title: 'リップ大革命！〜不要なリップからマーカーペンを作成する〜',
);
const Searched testSearchedValue2 = Searched(
  documentID: 22202390,
  category1: Category.society,
  category2: Category.art,
  subCategory1: SubCategory.beauty,
  subCategory2: SubCategory.none,
  year: 2022,
  eventName: EventName.individualTankyu,
  course:  Course.tankyu,
  title: 'そのWikipedia記事、信頼できそうですか︖〜Pythonを⽤いた信頼度評価〜',
);

const List<String> searchHistoryList = [ 'SNS','ぶしつ','履歴の保存機能はまだ未実装です'];