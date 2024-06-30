import 'dart:convert';

import 'package:kenryo_tankyu/providers/providers.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

part 'search.g.dart';

//ファイルが生成されなくてキレそうな時は…。笑
//①'search.g.dart'を書き直す
//②pabspec.lockファイルを消去
//③.freezedファイルと.gファイルを消去
//④flutter clean
//⑤アプリ再起動
//⑥flutter pub get
//⑦flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class Search with _$Search {

  @JsonSerializable(explicitToJson: true)
  const Search._();

  const factory Search({
    String? category,
    String? subCategory,
    int? year,
    String? eventName,
    String? course,
    @SearchWordConverter() List<String>? searchWord,
    int? numberOfHits,
    @DateTimeConverter() DateTime? savedAt,
  }) = _Search;

  factory Search.fromJson(Map<String,dynamic> json) => _$SearchFromJson(json);
}

class SearchWordConverter implements JsonConverter<List<String>, String> {
  const SearchWordConverter();

  @override
  List<String> fromJson(String json) {
    return jsonDecode(json);
  }

  @override
  String toJson(List<String> object) {
    return jsonEncode(object);
  }
}
