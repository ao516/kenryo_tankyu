import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search.freezed.dart';

@freezed
class Search with _$Search {
  const factory Search({
    String? category,
    String? subCategory,
    String? year,
    String? eventName,
    String? departure,
    List<String>? searchWord,
}) = _Search;
}