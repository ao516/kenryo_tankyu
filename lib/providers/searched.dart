import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'searched.freezed.dart';

@freezed
class Searched with _$Searched {
  const factory Searched({
    int? documentId,
    String? category1,
    String? category2,
    String? subCategory1,
    String? subCategory2,
    int? year,
    String? eventName,
    String? course,
    String? title,
    String? author,
    int? likes,
    bool? existsSlide,
    bool? existsReport,
    bool? existsThesis,
    bool? existsPoster,
    Uint8List? slidePdfBytes,
    Uint8List? reportPdfBytes,
    Uint8List? thesisPdfBytes,
    Uint8List? posterPdfBytes,
  }) = _Searched;
}
