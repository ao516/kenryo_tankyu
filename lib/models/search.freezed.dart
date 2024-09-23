// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../models/search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Search _$SearchFromJson(Map<String, dynamic> json) {
  return _Search.fromJson(json);
}

/// @nodoc
mixin _$Search {
  String? get category => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String? get course => throw _privateConstructorUsedError;
  @SearchWordConverter()
  List<String>? get searchWord => throw _privateConstructorUsedError;
  int? get numberOfHits => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get savedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCopyWith<Search> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res, Search>;
  @useResult
  $Res call(
      {String? category,
      String? subCategory,
      int? year,
      String? eventName,
      String? course,
      @SearchWordConverter() List<String>? searchWord,
      int? numberOfHits,
      @DateTimeConverter() DateTime? savedAt});
}

/// @nodoc
class _$SearchCopyWithImpl<$Res, $Val extends Search>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? year = freezed,
    Object? eventName = freezed,
    Object? course = freezed,
    Object? searchWord = freezed,
    Object? numberOfHits = freezed,
    Object? savedAt = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numberOfHits: freezed == numberOfHits
          ? _value.numberOfHits
          : numberOfHits // ignore: cast_nullable_to_non_nullable
              as int?,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      String? subCategory,
      int? year,
      String? eventName,
      String? course,
      @SearchWordConverter() List<String>? searchWord,
      int? numberOfHits,
      @DateTimeConverter() DateTime? savedAt});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? year = freezed,
    Object? eventName = freezed,
    Object? course = freezed,
    Object? searchWord = freezed,
    Object? numberOfHits = freezed,
    Object? savedAt = freezed,
  }) {
    return _then(_$SearchImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      searchWord: freezed == searchWord
          ? _value._searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numberOfHits: freezed == numberOfHits
          ? _value.numberOfHits
          : numberOfHits // ignore: cast_nullable_to_non_nullable
              as int?,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchImpl extends _Search {
  const _$SearchImpl(
      {this.category,
      this.subCategory,
      this.year,
      this.eventName,
      this.course,
      @SearchWordConverter() final List<String>? searchWord,
      this.numberOfHits,
      @DateTimeConverter() this.savedAt})
      : _searchWord = searchWord,
        super._();

  factory _$SearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchImplFromJson(json);

  @override
  final String? category;
  @override
  final String? subCategory;
  @override
  final int? year;
  @override
  final String? eventName;
  @override
  final String? course;
  final List<String>? _searchWord;
  @override
  @SearchWordConverter()
  List<String>? get searchWord {
    final value = _searchWord;
    if (value == null) return null;
    if (_searchWord is EqualUnmodifiableListView) return _searchWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? numberOfHits;
  @override
  @DateTimeConverter()
  final DateTime? savedAt;

  @override
  String toString() {
    return 'Search(category: $category, subCategory: $subCategory, year: $year, eventName: $eventName, course: $course, searchWord: $searchWord, numberOfHits: $numberOfHits, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality()
                .equals(other._searchWord, _searchWord) &&
            (identical(other.numberOfHits, numberOfHits) ||
                other.numberOfHits == numberOfHits) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      subCategory,
      year,
      eventName,
      course,
      const DeepCollectionEquality().hash(_searchWord),
      numberOfHits,
      savedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchImplToJson(
      this,
    );
  }
}

abstract class _Search extends Search {
  const factory _Search(
      {final String? category,
      final String? subCategory,
      final int? year,
      final String? eventName,
      final String? course,
      @SearchWordConverter() final List<String>? searchWord,
      final int? numberOfHits,
      @DateTimeConverter() final DateTime? savedAt}) = _$SearchImpl;
  const _Search._() : super._();

  factory _Search.fromJson(Map<String, dynamic> json) = _$SearchImpl.fromJson;

  @override
  String? get category;
  @override
  String? get subCategory;
  @override
  int? get year;
  @override
  String? get eventName;
  @override
  String? get course;
  @override
  @SearchWordConverter()
  List<String>? get searchWord;
  @override
  int? get numberOfHits;
  @override
  @DateTimeConverter()
  DateTime? get savedAt;
  @override
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
