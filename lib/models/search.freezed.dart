// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

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
  @CategoryEnumConverter()
  Category get category => throw _privateConstructorUsedError;
  @SubCategoryEnumConverter()
  SubCategory get subCategory => throw _privateConstructorUsedError;
  @EnterYearEnumConverter()
  EnterYear get enterYear => throw _privateConstructorUsedError;
  @EventNameEnumConverter()
  EventName get eventName => throw _privateConstructorUsedError;
  @CourseEnumConverter()
  Course get course => throw _privateConstructorUsedError;
  @SearchWordConverter()
  List<String> get searchWord => throw _privateConstructorUsedError;
  int get numberOfHits => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get savedAt => throw _privateConstructorUsedError;

  /// Serializes this Search to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Search
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCopyWith<Search> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res, Search>;
  @useResult
  $Res call(
      {@CategoryEnumConverter() Category category,
      @SubCategoryEnumConverter() SubCategory subCategory,
      @EnterYearEnumConverter() EnterYear enterYear,
      @EventNameEnumConverter() EventName eventName,
      @CourseEnumConverter() Course course,
      @SearchWordConverter() List<String> searchWord,
      int numberOfHits,
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

  /// Create a copy of Search
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? enterYear = null,
    Object? eventName = null,
    Object? course = null,
    Object? searchWord = null,
    Object? numberOfHits = null,
    Object? savedAt = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      enterYear: null == enterYear
          ? _value.enterYear
          : enterYear // ignore: cast_nullable_to_non_nullable
              as EnterYear,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as EventName,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      searchWord: null == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfHits: null == numberOfHits
          ? _value.numberOfHits
          : numberOfHits // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@CategoryEnumConverter() Category category,
      @SubCategoryEnumConverter() SubCategory subCategory,
      @EnterYearEnumConverter() EnterYear enterYear,
      @EventNameEnumConverter() EventName eventName,
      @CourseEnumConverter() Course course,
      @SearchWordConverter() List<String> searchWord,
      int numberOfHits,
      @DateTimeConverter() DateTime? savedAt});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$SearchCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Search
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? enterYear = null,
    Object? eventName = null,
    Object? course = null,
    Object? searchWord = null,
    Object? numberOfHits = null,
    Object? savedAt = freezed,
  }) {
    return _then(_$SearchImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      enterYear: null == enterYear
          ? _value.enterYear
          : enterYear // ignore: cast_nullable_to_non_nullable
              as EnterYear,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as EventName,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      searchWord: null == searchWord
          ? _value._searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfHits: null == numberOfHits
          ? _value.numberOfHits
          : numberOfHits // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@CategoryEnumConverter() required this.category,
      @SubCategoryEnumConverter() required this.subCategory,
      @EnterYearEnumConverter() required this.enterYear,
      @EventNameEnumConverter() required this.eventName,
      @CourseEnumConverter() required this.course,
      @SearchWordConverter() final List<String> searchWord = const [],
      this.numberOfHits = 0,
      @DateTimeConverter() this.savedAt})
      : _searchWord = searchWord,
        super._();

  factory _$SearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchImplFromJson(json);

  @override
  @CategoryEnumConverter()
  final Category category;
  @override
  @SubCategoryEnumConverter()
  final SubCategory subCategory;
  @override
  @EnterYearEnumConverter()
  final EnterYear enterYear;
  @override
  @EventNameEnumConverter()
  final EventName eventName;
  @override
  @CourseEnumConverter()
  final Course course;
  final List<String> _searchWord;
  @override
  @JsonKey()
  @SearchWordConverter()
  List<String> get searchWord {
    if (_searchWord is EqualUnmodifiableListView) return _searchWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchWord);
  }

  @override
  @JsonKey()
  final int numberOfHits;
  @override
  @DateTimeConverter()
  final DateTime? savedAt;

  @override
  String toString() {
    return 'Search(category: $category, subCategory: $subCategory, enterYear: $enterYear, eventName: $eventName, course: $course, searchWord: $searchWord, numberOfHits: $numberOfHits, savedAt: $savedAt)';
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
            (identical(other.enterYear, enterYear) ||
                other.enterYear == enterYear) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality()
                .equals(other._searchWord, _searchWord) &&
            (identical(other.numberOfHits, numberOfHits) ||
                other.numberOfHits == numberOfHits) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      subCategory,
      enterYear,
      eventName,
      course,
      const DeepCollectionEquality().hash(_searchWord),
      numberOfHits,
      savedAt);

  /// Create a copy of Search
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@CategoryEnumConverter() required final Category category,
      @SubCategoryEnumConverter() required final SubCategory subCategory,
      @EnterYearEnumConverter() required final EnterYear enterYear,
      @EventNameEnumConverter() required final EventName eventName,
      @CourseEnumConverter() required final Course course,
      @SearchWordConverter() final List<String> searchWord,
      final int numberOfHits,
      @DateTimeConverter() final DateTime? savedAt}) = _$SearchImpl;
  const _Search._() : super._();

  factory _Search.fromJson(Map<String, dynamic> json) = _$SearchImpl.fromJson;

  @override
  @CategoryEnumConverter()
  Category get category;
  @override
  @SubCategoryEnumConverter()
  SubCategory get subCategory;
  @override
  @EnterYearEnumConverter()
  EnterYear get enterYear;
  @override
  @EventNameEnumConverter()
  EventName get eventName;
  @override
  @CourseEnumConverter()
  Course get course;
  @override
  @SearchWordConverter()
  List<String> get searchWord;
  @override
  int get numberOfHits;
  @override
  @DateTimeConverter()
  DateTime? get savedAt;

  /// Create a copy of Search
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
