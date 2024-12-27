// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationContent _$NotificationContentFromJson(Map<String, dynamic> json) {
  return _NotificationContent.fromJson(json);
}

/// @nodoc
mixin _$NotificationContent {
  String get id => throw _privateConstructorUsedError;
  @NotificationTypeEnumConverter()
  NotificationType get type => throw _privateConstructorUsedError;
  String get headerImagePath => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get sendAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get savedAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  /// Serializes this NotificationContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationContentCopyWith<NotificationContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationContentCopyWith<$Res> {
  factory $NotificationContentCopyWith(
          NotificationContent value, $Res Function(NotificationContent) then) =
      _$NotificationContentCopyWithImpl<$Res, NotificationContent>;
  @useResult
  $Res call(
      {String id,
      @NotificationTypeEnumConverter() NotificationType type,
      String headerImagePath,
      String title,
      String contents,
      @DateTimeConverter() DateTime sendAt,
      @DateTimeConverter() DateTime savedAt,
      bool isRead});
}

/// @nodoc
class _$NotificationContentCopyWithImpl<$Res, $Val extends NotificationContent>
    implements $NotificationContentCopyWith<$Res> {
  _$NotificationContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? headerImagePath = null,
    Object? title = null,
    Object? contents = null,
    Object? sendAt = null,
    Object? savedAt = null,
    Object? isRead = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      headerImagePath: null == headerImagePath
          ? _value.headerImagePath
          : headerImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      sendAt: null == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationContentImplCopyWith<$Res>
    implements $NotificationContentCopyWith<$Res> {
  factory _$$NotificationContentImplCopyWith(_$NotificationContentImpl value,
          $Res Function(_$NotificationContentImpl) then) =
      __$$NotificationContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @NotificationTypeEnumConverter() NotificationType type,
      String headerImagePath,
      String title,
      String contents,
      @DateTimeConverter() DateTime sendAt,
      @DateTimeConverter() DateTime savedAt,
      bool isRead});
}

/// @nodoc
class __$$NotificationContentImplCopyWithImpl<$Res>
    extends _$NotificationContentCopyWithImpl<$Res, _$NotificationContentImpl>
    implements _$$NotificationContentImplCopyWith<$Res> {
  __$$NotificationContentImplCopyWithImpl(_$NotificationContentImpl _value,
      $Res Function(_$NotificationContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? headerImagePath = null,
    Object? title = null,
    Object? contents = null,
    Object? sendAt = null,
    Object? savedAt = null,
    Object? isRead = null,
  }) {
    return _then(_$NotificationContentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      headerImagePath: null == headerImagePath
          ? _value.headerImagePath
          : headerImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      sendAt: null == sendAt
          ? _value.sendAt
          : sendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationContentImpl extends _NotificationContent {
  const _$NotificationContentImpl(
      {required this.id,
      @NotificationTypeEnumConverter() required this.type,
      required this.headerImagePath,
      required this.title,
      required this.contents,
      @DateTimeConverter() required this.sendAt,
      @DateTimeConverter() required this.savedAt,
      required this.isRead})
      : super._();

  factory _$NotificationContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationContentImplFromJson(json);

  @override
  final String id;
  @override
  @NotificationTypeEnumConverter()
  final NotificationType type;
  @override
  final String headerImagePath;
  @override
  final String title;
  @override
  final String contents;
  @override
  @DateTimeConverter()
  final DateTime sendAt;
  @override
  @DateTimeConverter()
  final DateTime savedAt;
  @override
  final bool isRead;

  @override
  String toString() {
    return 'NotificationContent(id: $id, type: $type, headerImagePath: $headerImagePath, title: $title, contents: $contents, sendAt: $sendAt, savedAt: $savedAt, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationContentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.headerImagePath, headerImagePath) ||
                other.headerImagePath == headerImagePath) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.sendAt, sendAt) || other.sendAt == sendAt) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, headerImagePath, title,
      contents, sendAt, savedAt, isRead);

  /// Create a copy of NotificationContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationContentImplCopyWith<_$NotificationContentImpl> get copyWith =>
      __$$NotificationContentImplCopyWithImpl<_$NotificationContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationContentImplToJson(
      this,
    );
  }
}

abstract class _NotificationContent extends NotificationContent {
  const factory _NotificationContent(
      {required final String id,
      @NotificationTypeEnumConverter() required final NotificationType type,
      required final String headerImagePath,
      required final String title,
      required final String contents,
      @DateTimeConverter() required final DateTime sendAt,
      @DateTimeConverter() required final DateTime savedAt,
      required final bool isRead}) = _$NotificationContentImpl;
  const _NotificationContent._() : super._();

  factory _NotificationContent.fromJson(Map<String, dynamic> json) =
      _$NotificationContentImpl.fromJson;

  @override
  String get id;
  @override
  @NotificationTypeEnumConverter()
  NotificationType get type;
  @override
  String get headerImagePath;
  @override
  String get title;
  @override
  String get contents;
  @override
  @DateTimeConverter()
  DateTime get sendAt;
  @override
  @DateTimeConverter()
  DateTime get savedAt;
  @override
  bool get isRead;

  /// Create a copy of NotificationContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationContentImplCopyWith<_$NotificationContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
