// ignore_for_file: invalid_annotation_target

import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'documentID', includeFromJson: false, includeToJson: true)
    @Default('empty')
    String documentID,
    @JsonKey(name: 'isFavorite', includeFromJson: false, includeToJson: true)
    @Default(0)
    int isFavorite,
    @JsonKey(name: 'category1') required String category1,
    @JsonKey(name: 'category2') required String category2,
    @JsonKey(name: 'subCategory1') required String subCategory1,
    @JsonKey(name: 'subCategory2') required String subCategory2,
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'eventName') required String eventName,
    @JsonKey(name: 'course') required String course,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'author', includeFromJson: true, includeToJson: false)
    String? author,
    @JsonKey(name: 'vagueLikes', includeFromJson: true, includeToJson: false)
    int? vagueLikes,
    @JsonKey(name: 'exactLikes', includeFromJson: true, includeToJson: false)
    int? exactLikes,
    @JsonKey(name: 'existsSlide', includeFromJson: true, includeToJson: false)
    bool? existsSlide,
    @JsonKey(name: 'existsReport', includeFromJson: true, includeToJson: false)
    bool? existsReport,
    @JsonKey(name: 'existsThesis', includeFromJson: true, includeToJson: false)
    bool? existsThesis,
    @JsonKey(name: 'existsPoster', includeFromJson: true, includeToJson: false)
    bool? existsPoster,
    @DateTimeConverter() DateTime? savedAt,
  }) = _Searched;

  factory Searched.fromJson(Map<String, dynamic> json) =>
      _$SearchedFromJson(json);

  ///Algoliaから取得したsnapshotは、objectIDとisFavoriteのみjson形式ではないため、無理やりcopyWithで変換して付け加えている。
  factory Searched.fromAlgolia(AlgoliaObjectSnapshot doc, int isFavorite) {
    final Map<String, dynamic> data = doc.data;
    return Searched.fromJson(data)
        .copyWith(documentID: doc.objectID, isFavorite: isFavorite);
  }
  factory Searched.fromFirestore(DocumentSnapshot doc, int isFavorite) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Searched.fromJson(data)
        .copyWith(documentID: doc.id, isFavorite: isFavorite);
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
    return DateTime.parse(json).toLocal(); //TODO ここどうすっぺ？
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
