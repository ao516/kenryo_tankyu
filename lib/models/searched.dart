// ignore_for_file: invalid_annotation_target

import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenryo_tankyu/models/models.dart';

part 'searched.freezed.dart';
part 'searched.g.dart';
///ルール
///この「Searched」型では、探究作品を検索したときのデータの保管、検索結果のfirestoreのデータの保管、ローカルDBとしてのデータの保管、ユーザーがいいねしているかどうかなど、全てを管理しています。
///ローカルDBとしての保管としても利用するので、保守がちょいめんどくさいです。
///アプリリリース後に新しいプロパティを作成する場合は、データベースの再作成させるか、追加するプロパティは全てnull許容になるように設計してください。

///includeFromJsonと、includeToJsonは、json形式のデータを作成する際に、そのプロパティを含めるかどうかを指定するもの。
///documentIDとisFavoriteは、firestoreやalgoliaのデータから取得する際には含まれていないので、includeFromJsonをfalseにしています。
///後半の方（ライク数や、authorなど）は、DBには保存しないため、includeToJsonをfalseにしています。
@freezed
class Searched with _$Searched {
  @JsonSerializable(explicitToJson: true)
  const Searched._();

  const factory Searched({
    @Default(00000000) int documentID,
    @Default(false) bool isFavorite,
    @CategoryEnumConverter() required Category category1,
    @SubCategoryEnumConverter() required SubCategory subCategory1,
    @CategoryEnumConverter() required Category category2,
    @SubCategoryEnumConverter() required SubCategory subCategory2,
    @EnterYearEnumConverter() required EnterYear enterYear,
    @EventNameEnumConverter() required EventName eventName,
    @CourseEnumConverter() required Course course,
    @Default('') String title,
    @Default('') String author,
    @Default(0) int vagueLikes,
    @Default(0) int exactLikes,
    @Default(false) bool existsSlide,
    @Default(false) bool existsReport,
    @Default(false) bool existsThesis,
    @Default(false) bool existsPoster,
    @DateTimeConverter() DateTime? savedAt,
    @Default(true) bool isCached,
  }) = _Searched;

  factory Searched.fromJson(Map<String, dynamic> json) =>
      _$SearchedFromJson(json);

  ///Algoliaから取得したsnapshotは、objectIDとisFavoriteのみjson形式ではないため、無理やりcopyWithで変換して付け加えている。
  factory Searched.fromAlgolia(AlgoliaObjectSnapshot doc, bool isFavorite) {
    final Map<String, dynamic> data = doc.data;
    return Searched.fromJson(data)
        .copyWith(documentID: int.parse(doc.objectID), isFavorite: isFavorite,isCached: false);
  }
  factory Searched.fromFirestore(DocumentSnapshot doc, bool isFavorite) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Searched.fromJson(data)
        .copyWith(documentID: int.parse(doc.id), isFavorite: isFavorite, isCached: false);
  }
  factory Searched.fromSQLite(Map<String,dynamic> json) {
    final mutableJson = Map<String, dynamic>.from(json);
    //SQLiteから取得したデータは、0,1で保存されているため、bool型に変換する。
    //searchedはimmutableなので、mutableJsonを作成してから新たなインスタンスを生成している。
    mutableJson['isFavorite'] = mutableJson['isFavorite'] == 1;
    mutableJson['existsSlide'] = mutableJson['existsSlide'] == 1;
    mutableJson['existsReport'] = mutableJson['existsReport'] == 1;
    mutableJson['existsThesis'] = mutableJson['existsThesis'] == 1;
    mutableJson['existsPoster'] = mutableJson['existsPoster'] == 1;
    final searched = Searched.fromJson(mutableJson);
    return searched;
  }

  Map<String, dynamic> toSQLite() {
    final json = this.toJson();
    json.remove('isCached');
    json['isFavorite'] = this.isFavorite ? 1 : 0;
    json['existsSlide'] = this.existsSlide ? 1 : 0;
    json['existsReport'] = this.existsReport ? 1 : 0;
    json['existsThesis'] = this.existsThesis ? 1 : 0;
    json['existsPoster'] = this.existsPoster ? 1 : 0;
    json['savedAt'] = DateTime.now().toIso8601String();
    return json;
  }
}

//DateTime型をjsonに変換するための独自クラス
//参考元 https://zenn.dev/tokku5552/articles/json_converter_freezed
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
