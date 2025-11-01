// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searched.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Searched _$SearchedFromJson(Map<String, dynamic> json) {
  return _Searched.fromJson(json);
}

/// @nodoc
mixin _$Searched {
  int get documentID => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  @CategoryEnumConverter()
  Category get category1 => throw _privateConstructorUsedError;
  @SubCategoryEnumConverter()
  SubCategory get subCategory1 => throw _privateConstructorUsedError;
  @CategoryEnumConverter()
  Category get category2 => throw _privateConstructorUsedError;
  @SubCategoryEnumConverter()
  SubCategory get subCategory2 => throw _privateConstructorUsedError;
  @EnterYearEnumConverter()
  EnterYear get enterYear => throw _privateConstructorUsedError;
  @EventNameEnumConverter()
  EventName get eventName => throw _privateConstructorUsedError;
  @CourseEnumConverter()
  Course get course => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  int get vagueLikes => throw _privateConstructorUsedError;
  int get exactLikes => throw _privateConstructorUsedError;
  bool get existsSlide => throw _privateConstructorUsedError;
  bool get existsReport => throw _privateConstructorUsedError;
  bool get existsThesis => throw _privateConstructorUsedError;
  bool get existsPoster => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get savedAt => throw _privateConstructorUsedError;
  bool get isCached => throw _privateConstructorUsedError;

  /// Serializes this Searched to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Searched
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchedCopyWith<Searched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedCopyWith<$Res> {
  factory $SearchedCopyWith(Searched value, $Res Function(Searched) then) =
      _$SearchedCopyWithImpl<$Res, Searched>;
  @useResult
  $Res call(
      {int documentID,
      bool isFavorite,
      @CategoryEnumConverter() Category category1,
      @SubCategoryEnumConverter() SubCategory subCategory1,
      @CategoryEnumConverter() Category category2,
      @SubCategoryEnumConverter() SubCategory subCategory2,
      @EnterYearEnumConverter() EnterYear enterYear,
      @EventNameEnumConverter() EventName eventName,
      @CourseEnumConverter() Course course,
      String title,
      String author,
      int vagueLikes,
      int exactLikes,
      bool existsSlide,
      bool existsReport,
      bool existsThesis,
      bool existsPoster,
      @DateTimeConverter() DateTime? savedAt,
      bool isCached});
}

/// @nodoc
class _$SearchedCopyWithImpl<$Res, $Val extends Searched>
    implements $SearchedCopyWith<$Res> {
  _$SearchedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Searched
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentID = null,
    Object? isFavorite = null,
    Object? category1 = null,
    Object? subCategory1 = null,
    Object? category2 = null,
    Object? subCategory2 = null,
    Object? enterYear = null,
    Object? eventName = null,
    Object? course = null,
    Object? title = null,
    Object? author = null,
    Object? vagueLikes = null,
    Object? exactLikes = null,
    Object? existsSlide = null,
    Object? existsReport = null,
    Object? existsThesis = null,
    Object? existsPoster = null,
    Object? savedAt = freezed,
    Object? isCached = null,
  }) {
    return _then(_value.copyWith(
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      category1: null == category1
          ? _value.category1
          : category1 // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory2: null == subCategory2
          ? _value.subCategory2
          : subCategory2 // ignore: cast_nullable_to_non_nullable
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      vagueLikes: null == vagueLikes
          ? _value.vagueLikes
          : vagueLikes // ignore: cast_nullable_to_non_nullable
              as int,
      exactLikes: null == exactLikes
          ? _value.exactLikes
          : exactLikes // ignore: cast_nullable_to_non_nullable
              as int,
      existsSlide: null == existsSlide
          ? _value.existsSlide
          : existsSlide // ignore: cast_nullable_to_non_nullable
              as bool,
      existsReport: null == existsReport
          ? _value.existsReport
          : existsReport // ignore: cast_nullable_to_non_nullable
              as bool,
      existsThesis: null == existsThesis
          ? _value.existsThesis
          : existsThesis // ignore: cast_nullable_to_non_nullable
              as bool,
      existsPoster: null == existsPoster
          ? _value.existsPoster
          : existsPoster // ignore: cast_nullable_to_non_nullable
              as bool,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCached: null == isCached
          ? _value.isCached
          : isCached // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchedImplCopyWith<$Res>
    implements $SearchedCopyWith<$Res> {
  factory _$$SearchedImplCopyWith(
          _$SearchedImpl value, $Res Function(_$SearchedImpl) then) =
      __$$SearchedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int documentID,
      bool isFavorite,
      @CategoryEnumConverter() Category category1,
      @SubCategoryEnumConverter() SubCategory subCategory1,
      @CategoryEnumConverter() Category category2,
      @SubCategoryEnumConverter() SubCategory subCategory2,
      @EnterYearEnumConverter() EnterYear enterYear,
      @EventNameEnumConverter() EventName eventName,
      @CourseEnumConverter() Course course,
      String title,
      String author,
      int vagueLikes,
      int exactLikes,
      bool existsSlide,
      bool existsReport,
      bool existsThesis,
      bool existsPoster,
      @DateTimeConverter() DateTime? savedAt,
      bool isCached});
}

/// @nodoc
class __$$SearchedImplCopyWithImpl<$Res>
    extends _$SearchedCopyWithImpl<$Res, _$SearchedImpl>
    implements _$$SearchedImplCopyWith<$Res> {
  __$$SearchedImplCopyWithImpl(
      _$SearchedImpl _value, $Res Function(_$SearchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Searched
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentID = null,
    Object? isFavorite = null,
    Object? category1 = null,
    Object? subCategory1 = null,
    Object? category2 = null,
    Object? subCategory2 = null,
    Object? enterYear = null,
    Object? eventName = null,
    Object? course = null,
    Object? title = null,
    Object? author = null,
    Object? vagueLikes = null,
    Object? exactLikes = null,
    Object? existsSlide = null,
    Object? existsReport = null,
    Object? existsThesis = null,
    Object? existsPoster = null,
    Object? savedAt = freezed,
    Object? isCached = null,
  }) {
    return _then(_$SearchedImpl(
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      category1: null == category1
          ? _value.category1
          : category1 // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory2: null == subCategory2
          ? _value.subCategory2
          : subCategory2 // ignore: cast_nullable_to_non_nullable
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      vagueLikes: null == vagueLikes
          ? _value.vagueLikes
          : vagueLikes // ignore: cast_nullable_to_non_nullable
              as int,
      exactLikes: null == exactLikes
          ? _value.exactLikes
          : exactLikes // ignore: cast_nullable_to_non_nullable
              as int,
      existsSlide: null == existsSlide
          ? _value.existsSlide
          : existsSlide // ignore: cast_nullable_to_non_nullable
              as bool,
      existsReport: null == existsReport
          ? _value.existsReport
          : existsReport // ignore: cast_nullable_to_non_nullable
              as bool,
      existsThesis: null == existsThesis
          ? _value.existsThesis
          : existsThesis // ignore: cast_nullable_to_non_nullable
              as bool,
      existsPoster: null == existsPoster
          ? _value.existsPoster
          : existsPoster // ignore: cast_nullable_to_non_nullable
              as bool,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCached: null == isCached
          ? _value.isCached
          : isCached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchedImpl extends _Searched {
  const _$SearchedImpl(
      {this.documentID = 00000000,
      this.isFavorite = false,
      @CategoryEnumConverter() required this.category1,
      @SubCategoryEnumConverter() required this.subCategory1,
      @CategoryEnumConverter() required this.category2,
      @SubCategoryEnumConverter() required this.subCategory2,
      @EnterYearEnumConverter() required this.enterYear,
      @EventNameEnumConverter() required this.eventName,
      @CourseEnumConverter() required this.course,
      this.title = '',
      this.author = '',
      this.vagueLikes = 0,
      this.exactLikes = 0,
      this.existsSlide = false,
      this.existsReport = false,
      this.existsThesis = false,
      this.existsPoster = false,
      @DateTimeConverter() this.savedAt,
      this.isCached = true})
      : super._();

  factory _$SearchedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchedImplFromJson(json);

  @override
  @JsonKey()
  final int documentID;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @CategoryEnumConverter()
  final Category category1;
  @override
  @SubCategoryEnumConverter()
  final SubCategory subCategory1;
  @override
  @CategoryEnumConverter()
  final Category category2;
  @override
  @SubCategoryEnumConverter()
  final SubCategory subCategory2;
  @override
  @EnterYearEnumConverter()
  final EnterYear enterYear;
  @override
  @EventNameEnumConverter()
  final EventName eventName;
  @override
  @CourseEnumConverter()
  final Course course;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final int vagueLikes;
  @override
  @JsonKey()
  final int exactLikes;
  @override
  @JsonKey()
  final bool existsSlide;
  @override
  @JsonKey()
  final bool existsReport;
  @override
  @JsonKey()
  final bool existsThesis;
  @override
  @JsonKey()
  final bool existsPoster;
  @override
  @DateTimeConverter()
  final DateTime? savedAt;
  @override
  @JsonKey()
  final bool isCached;

  @override
  String toString() {
    return 'Searched(documentID: $documentID, isFavorite: $isFavorite, category1: $category1, subCategory1: $subCategory1, category2: $category2, subCategory2: $subCategory2, enterYear: $enterYear, eventName: $eventName, course: $course, title: $title, author: $author, vagueLikes: $vagueLikes, exactLikes: $exactLikes, existsSlide: $existsSlide, existsReport: $existsReport, existsThesis: $existsThesis, existsPoster: $existsPoster, savedAt: $savedAt, isCached: $isCached)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedImpl &&
            (identical(other.documentID, documentID) ||
                other.documentID == documentID) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.category1, category1) ||
                other.category1 == category1) &&
            (identical(other.subCategory1, subCategory1) ||
                other.subCategory1 == subCategory1) &&
            (identical(other.category2, category2) ||
                other.category2 == category2) &&
            (identical(other.subCategory2, subCategory2) ||
                other.subCategory2 == subCategory2) &&
            (identical(other.enterYear, enterYear) ||
                other.enterYear == enterYear) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.vagueLikes, vagueLikes) ||
                other.vagueLikes == vagueLikes) &&
            (identical(other.exactLikes, exactLikes) ||
                other.exactLikes == exactLikes) &&
            (identical(other.existsSlide, existsSlide) ||
                other.existsSlide == existsSlide) &&
            (identical(other.existsReport, existsReport) ||
                other.existsReport == existsReport) &&
            (identical(other.existsThesis, existsThesis) ||
                other.existsThesis == existsThesis) &&
            (identical(other.existsPoster, existsPoster) ||
                other.existsPoster == existsPoster) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.isCached, isCached) ||
                other.isCached == isCached));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        documentID,
        isFavorite,
        category1,
        subCategory1,
        category2,
        subCategory2,
        enterYear,
        eventName,
        course,
        title,
        author,
        vagueLikes,
        exactLikes,
        existsSlide,
        existsReport,
        existsThesis,
        existsPoster,
        savedAt,
        isCached
      ]);

  /// Create a copy of Searched
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchedImplCopyWith<_$SearchedImpl> get copyWith =>
      __$$SearchedImplCopyWithImpl<_$SearchedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchedImplToJson(
      this,
    );
  }
}

abstract class _Searched extends Searched {
  const factory _Searched(
      {final int documentID,
      final bool isFavorite,
      @CategoryEnumConverter() required final Category category1,
      @SubCategoryEnumConverter() required final SubCategory subCategory1,
      @CategoryEnumConverter() required final Category category2,
      @SubCategoryEnumConverter() required final SubCategory subCategory2,
      @EnterYearEnumConverter() required final EnterYear enterYear,
      @EventNameEnumConverter() required final EventName eventName,
      @CourseEnumConverter() required final Course course,
      final String title,
      final String author,
      final int vagueLikes,
      final int exactLikes,
      final bool existsSlide,
      final bool existsReport,
      final bool existsThesis,
      final bool existsPoster,
      @DateTimeConverter() final DateTime? savedAt,
      final bool isCached}) = _$SearchedImpl;
  const _Searched._() : super._();

  factory _Searched.fromJson(Map<String, dynamic> json) =
      _$SearchedImpl.fromJson;

  @override
  int get documentID;
  @override
  bool get isFavorite;
  @override
  @CategoryEnumConverter()
  Category get category1;
  @override
  @SubCategoryEnumConverter()
  SubCategory get subCategory1;
  @override
  @CategoryEnumConverter()
  Category get category2;
  @override
  @SubCategoryEnumConverter()
  SubCategory get subCategory2;
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
  String get title;
  @override
  String get author;
  @override
  int get vagueLikes;
  @override
  int get exactLikes;
  @override
  bool get existsSlide;
  @override
  bool get existsReport;
  @override
  bool get existsThesis;
  @override
  bool get existsPoster;
  @override
  @DateTimeConverter()
  DateTime? get savedAt;
  @override
  bool get isCached;

  /// Create a copy of Searched
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchedImplCopyWith<_$SearchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
