// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchImpl _$$SearchImplFromJson(Map<String, dynamic> json) => _$SearchImpl(
      category:
          const CategoryEnumConverter().fromJson(json['category'] as String),
      subCategory: const SubCategoryEnumConverter()
          .fromJson(json['subCategory'] as String),
      year: (json['year'] as num?)?.toInt(),
      eventName:
          const EventNameEnumConverter().fromJson(json['eventName'] as String),
      course: const CourseEnumConverter().fromJson(json['course'] as String),
      searchWord: _$JsonConverterFromJson<String, List<String>>(
          json['searchWord'], const SearchWordConverter().fromJson),
      numberOfHits: (json['numberOfHits'] as num?)?.toInt(),
      savedAt: _$JsonConverterFromJson<String, DateTime>(
          json['savedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$SearchImplToJson(_$SearchImpl instance) =>
    <String, dynamic>{
      'category': const CategoryEnumConverter().toJson(instance.category),
      'subCategory':
          const SubCategoryEnumConverter().toJson(instance.subCategory),
      'year': instance.year,
      'eventName': const EventNameEnumConverter().toJson(instance.eventName),
      'course': const CourseEnumConverter().toJson(instance.course),
      'searchWord': _$JsonConverterToJson<String, List<String>>(
          instance.searchWord, const SearchWordConverter().toJson),
      'numberOfHits': instance.numberOfHits,
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
