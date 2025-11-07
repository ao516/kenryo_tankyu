// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Teacher {
  String get id;
  String get name;
  String get nameKana;
  @SubjectEnumConverter()
  SubjectType get subject;
  @GradeInChargeEnumConverter()
  GradeInCharge get gradeInCharge;
  String get filename;
  List<String> get keywords;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeacherCopyWith<Teacher> get copyWith =>
      _$TeacherCopyWithImpl<Teacher>(this as Teacher, _$identity);

  /// Serializes this Teacher to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Teacher &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameKana, nameKana) ||
                other.nameKana == nameKana) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.gradeInCharge, gradeInCharge) ||
                other.gradeInCharge == gradeInCharge) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            const DeepCollectionEquality().equals(other.keywords, keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nameKana, subject,
      gradeInCharge, filename, const DeepCollectionEquality().hash(keywords));

  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, nameKana: $nameKana, subject: $subject, gradeInCharge: $gradeInCharge, filename: $filename, keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class $TeacherCopyWith<$Res> {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) _then) =
      _$TeacherCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String nameKana,
      @SubjectEnumConverter() SubjectType subject,
      @GradeInChargeEnumConverter() GradeInCharge gradeInCharge,
      String filename,
      List<String> keywords});
}

/// @nodoc
class _$TeacherCopyWithImpl<$Res> implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._self, this._then);

  final Teacher _self;
  final $Res Function(Teacher) _then;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameKana = null,
    Object? subject = null,
    Object? gradeInCharge = null,
    Object? filename = null,
    Object? keywords = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: null == nameKana
          ? _self.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectType,
      gradeInCharge: null == gradeInCharge
          ? _self.gradeInCharge
          : gradeInCharge // ignore: cast_nullable_to_non_nullable
              as GradeInCharge,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Teacher].
extension TeacherPatterns on Teacher {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Teacher value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Teacher() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Teacher value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Teacher():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Teacher value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Teacher() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String nameKana,
            @SubjectEnumConverter() SubjectType subject,
            @GradeInChargeEnumConverter() GradeInCharge gradeInCharge,
            String filename,
            List<String> keywords)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Teacher() when $default != null:
        return $default(_that.id, _that.name, _that.nameKana, _that.subject,
            _that.gradeInCharge, _that.filename, _that.keywords);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String nameKana,
            @SubjectEnumConverter() SubjectType subject,
            @GradeInChargeEnumConverter() GradeInCharge gradeInCharge,
            String filename,
            List<String> keywords)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Teacher():
        return $default(_that.id, _that.name, _that.nameKana, _that.subject,
            _that.gradeInCharge, _that.filename, _that.keywords);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String nameKana,
            @SubjectEnumConverter() SubjectType subject,
            @GradeInChargeEnumConverter() GradeInCharge gradeInCharge,
            String filename,
            List<String> keywords)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Teacher() when $default != null:
        return $default(_that.id, _that.name, _that.nameKana, _that.subject,
            _that.gradeInCharge, _that.filename, _that.keywords);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Teacher implements Teacher {
  const _Teacher(
      {required this.id,
      required this.name,
      required this.nameKana,
      @SubjectEnumConverter() this.subject = SubjectType.other,
      @GradeInChargeEnumConverter() this.gradeInCharge = GradeInCharge.unknown,
      required this.filename,
      final List<String> keywords = const []})
      : _keywords = keywords;
  factory _Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameKana;
  @override
  @JsonKey()
  @SubjectEnumConverter()
  final SubjectType subject;
  @override
  @JsonKey()
  @GradeInChargeEnumConverter()
  final GradeInCharge gradeInCharge;
  @override
  final String filename;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeacherCopyWith<_Teacher> get copyWith =>
      __$TeacherCopyWithImpl<_Teacher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TeacherToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Teacher &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameKana, nameKana) ||
                other.nameKana == nameKana) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.gradeInCharge, gradeInCharge) ||
                other.gradeInCharge == gradeInCharge) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, nameKana, subject,
      gradeInCharge, filename, const DeepCollectionEquality().hash(_keywords));

  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, nameKana: $nameKana, subject: $subject, gradeInCharge: $gradeInCharge, filename: $filename, keywords: $keywords)';
  }
}

/// @nodoc
abstract mixin class _$TeacherCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$TeacherCopyWith(_Teacher value, $Res Function(_Teacher) _then) =
      __$TeacherCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameKana,
      @SubjectEnumConverter() SubjectType subject,
      @GradeInChargeEnumConverter() GradeInCharge gradeInCharge,
      String filename,
      List<String> keywords});
}

/// @nodoc
class __$TeacherCopyWithImpl<$Res> implements _$TeacherCopyWith<$Res> {
  __$TeacherCopyWithImpl(this._self, this._then);

  final _Teacher _self;
  final $Res Function(_Teacher) _then;

  /// Create a copy of Teacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameKana = null,
    Object? subject = null,
    Object? gradeInCharge = null,
    Object? filename = null,
    Object? keywords = null,
  }) {
    return _then(_Teacher(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: null == nameKana
          ? _self.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectType,
      gradeInCharge: null == gradeInCharge
          ? _self.gradeInCharge
          : gradeInCharge // ignore: cast_nullable_to_non_nullable
              as GradeInCharge,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _self._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
