// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    _$TeacherImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameKana: json['nameKana'] as String,
      subject: json['subject'] == null
          ? SubjectType.other
          : const SubjectEnumConverter().fromJson(json['subject'] as String),
      gradeInCharge: json['gradeInCharge'] == null
          ? GradeInCharge.unknown
          : const GradeInChargeEnumConverter()
              .fromJson(json['gradeInCharge'] as String),
      filename: json['filename'] as String,
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameKana': instance.nameKana,
      'subject': const SubjectEnumConverter().toJson(instance.subject),
      'gradeInCharge':
          const GradeInChargeEnumConverter().toJson(instance.gradeInCharge),
      'filename': instance.filename,
      'keywords': instance.keywords,
    };
