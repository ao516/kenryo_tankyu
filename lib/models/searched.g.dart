// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchedImpl _$$SearchedImplFromJson(Map<String, dynamic> json) =>
    _$SearchedImpl(
      category1:
          const CategoryEnumConverter().fromJson(json['category1'] as String),
      subCategory1: const SubCategoryEnumConverter()
          .fromJson(json['subCategory1'] as String),
      category2:
          const CategoryEnumConverter().fromJson(json['category2'] as String),
      subCategory2: const SubCategoryEnumConverter()
          .fromJson(json['subCategory2'] as String),
      year: (json['year'] as num).toInt(),
      eventName:
          const EventNameEnumConverter().fromJson(json['eventName'] as String),
      course: const CourseEnumConverter().fromJson(json['course'] as String),
      title: json['title'] as String,
      author: json['author'] as String?,
      vagueLikes: (json['vagueLikes'] as num?)?.toInt(),
      exactLikes: (json['exactLikes'] as num?)?.toInt(),
      existsSlide: json['existsSlide'] as bool?,
      existsReport: json['existsReport'] as bool?,
      existsThesis: json['existsThesis'] as bool?,
      existsPoster: json['existsPoster'] as bool?,
      savedAt: _$JsonConverterFromJson<String, DateTime>(
          json['savedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$SearchedImplToJson(_$SearchedImpl instance) =>
    <String, dynamic>{
      'documentID': instance.documentID,
      'isFavorite': instance.isFavorite,
      'category1': const CategoryEnumConverter().toJson(instance.category1),
      'subCategory1':
          const SubCategoryEnumConverter().toJson(instance.subCategory1),
      'category2': const CategoryEnumConverter().toJson(instance.category2),
      'subCategory2':
          const SubCategoryEnumConverter().toJson(instance.subCategory2),
      'year': instance.year,
      'eventName': const EventNameEnumConverter().toJson(instance.eventName),
      'course': const CourseEnumConverter().toJson(instance.course),
      'title': instance.title,
      'savedAt': _$JsonConverterToJson<String, DateTime>(
          instance.savedAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
