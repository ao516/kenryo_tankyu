// ignore_for_file: invalid_annotation_target

import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    @JsonKey(includeFromJson: false, includeToJson: true)
    @Default(0)
    int documentID,
    @JsonKey(includeFromJson: false, includeToJson: true)
    @Default(0)
    int isFavorite,
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
    @JsonKey(includeFromJson: true, includeToJson: false)
    @Default(false)
    bool existsSlide,
    @JsonKey(includeFromJson: true, includeToJson: false)
    @Default(false)
    bool existsReport,
    @JsonKey(includeFromJson: true, includeToJson: false)
    @Default(false)
    bool existsThesis,
    @JsonKey(includeFromJson: true, includeToJson: false)
    @Default(false)
    bool existsPoster,
    @DateTimeConverter() DateTime? savedAt,
  }) = _Searched;

  factory Searched.fromJson(Map<String, dynamic> json) =>
      _$SearchedFromJson(json);

  ///Algoliaから取得したsnapshotは、objectIDとisFavoriteのみjson形式ではないため、無理やりcopyWithで変換して付け加えている。
  factory Searched.fromAlgolia(AlgoliaObjectSnapshot doc, int isFavorite) {
    final Map<String, dynamic> data = doc.data;
    debugPrint('通るよー⭐️ data: $data');
    return Searched.fromJson(data)
        .copyWith(documentID: int.parse(doc.objectID), isFavorite: isFavorite);
  }
  factory Searched.fromFirestore(DocumentSnapshot doc, int isFavorite) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Searched.fromJson(data)
        .copyWith(documentID: int.parse(doc.id), isFavorite: isFavorite);
  }
  factory Searched.fromSQLite(Map<String, dynamic> searched) {
    return Searched.fromJson(searched).copyWith(
        documentID: searched['documentID'], isFavorite: searched['isFavorite']);
  }
}

//DateTime型をjsonに変換するための独自クラス
//参考元 https://zenn.dev/tokku5552/articles/json_converter_freezed
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    debugPrint('DateTimeConverter fromJson: $json');
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
