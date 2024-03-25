// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchedImpl _$$SearchedImplFromJson(Map<String, dynamic> json) =>
    _$SearchedImpl(
      category1: json['category1'] as String,
      category2: json['category2'] as String,
      subCategory1: json['subCategory1'] as String,
      subCategory2: json['subCategory2'] as String,
      year: json['year'] as int,
      eventName: json['eventName'] as String,
      course: json['course'] as String,
      title: json['title'] as String,
      author: json['author'] as String?,
      vagueLikes: json['vagueLikes'] as String?,
      exactLikes: json['exactLikes'] as int?,
      existsSlide: json['existsSlide'] as bool?,
      existsReport: json['existsReport'] as bool?,
      existsThesis: json['existsThesis'] as bool?,
      existsPoster: json['existsPoster'] as bool?,
    );

Map<String, dynamic> _$$SearchedImplToJson(_$SearchedImpl instance) =>
    <String, dynamic>{
      'category1': instance.category1,
      'category2': instance.category2,
      'subCategory1': instance.subCategory1,
      'subCategory2': instance.subCategory2,
      'year': instance.year,
      'eventName': instance.eventName,
      'course': instance.course,
      'title': instance.title,
      'author': instance.author,
      'vagueLikes': instance.vagueLikes,
      'exactLikes': instance.exactLikes,
      'existsSlide': instance.existsSlide,
      'existsReport': instance.existsReport,
      'existsThesis': instance.existsThesis,
      'existsPoster': instance.existsPoster,
    };
