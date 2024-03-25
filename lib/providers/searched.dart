
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searched.freezed.dart';
part 'searched.g.dart';



@freezed
class Searched with _$Searched {

  const Searched._();

  const factory Searched({
    @JsonKey(name: 'category1') required String category1,
    @JsonKey(name: 'category2') required String category2,
    @JsonKey(name: 'subCategory1') required String subCategory1,
    @JsonKey(name: 'subCategory2') required String subCategory2,
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'eventName') required String eventName,
    @JsonKey(name: 'course') required String course,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'vagueLikes')  String? vagueLikes,
    @JsonKey(name: 'exactLikes') int? exactLikes,
    @JsonKey(name: 'existsSlide')  bool? existsSlide,
    @JsonKey(name: 'existsReport')  bool? existsReport,
    @JsonKey(name: 'existsThesis')  bool? existsThesis,
    @JsonKey(name: 'existsPoster')  bool? existsPoster,

  }) = _Searched;

  factory Searched.fromJson(Map<String, dynamic> json) => _$SearchedFromJson(json);
}
