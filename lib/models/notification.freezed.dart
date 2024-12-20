// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  int get id => throw _privateConstructorUsedError;
  @NotificationTypeEnumConverter()
  NotificationType get type => throw _privateConstructorUsedError;
  String get headerImageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get sendAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get savedAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {int id,
      @NotificationTypeEnumConverter() NotificationType type,
      String headerImageUrl,
      String title,
      String contents,
      @DateTimeConverter() DateTime sendAt,
      @DateTimeConverter() DateTime savedAt,
      bool isRead});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? headerImageUrl = null,
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
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      headerImageUrl: null == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @NotificationTypeEnumConverter() NotificationType type,
      String headerImageUrl,
      String title,
      String contents,
      @DateTimeConverter() DateTime sendAt,
      @DateTimeConverter() DateTime savedAt,
      bool isRead});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? headerImageUrl = null,
    Object? title = null,
    Object? contents = null,
    Object? sendAt = null,
    Object? savedAt = null,
    Object? isRead = null,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      headerImageUrl: null == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
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
class _$NotificationImpl extends _Notification {
  const _$NotificationImpl(
      {required this.id,
      @NotificationTypeEnumConverter() required this.type,
      required this.headerImageUrl,
      required this.title,
      required this.contents,
      @DateTimeConverter() required this.sendAt,
      @DateTimeConverter() required this.savedAt,
      required this.isRead})
      : super._();

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final int id;
  @override
  @NotificationTypeEnumConverter()
  final NotificationType type;
  @override
  final String headerImageUrl;
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
    return 'Notification(id: $id, type: $type, headerImageUrl: $headerImageUrl, title: $title, contents: $contents, sendAt: $sendAt, savedAt: $savedAt, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.sendAt, sendAt) || other.sendAt == sendAt) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, headerImageUrl, title,
      contents, sendAt, savedAt, isRead);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification extends Notification {
  const factory _Notification(
      {required final int id,
      @NotificationTypeEnumConverter() required final NotificationType type,
      required final String headerImageUrl,
      required final String title,
      required final String contents,
      @DateTimeConverter() required final DateTime sendAt,
      @DateTimeConverter() required final DateTime savedAt,
      required final bool isRead}) = _$NotificationImpl;
  const _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  int get id;
  @override
  @NotificationTypeEnumConverter()
  NotificationType get type;
  @override
  String get headerImageUrl;
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

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
