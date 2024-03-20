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
  @JsonKey(name: 'category1')
  String get category1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'category2')
  String get category2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'subCategory1')
  String get subCategory1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'subCategory2')
  String get subCategory2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventName')
  String get eventName => throw _privateConstructorUsedError;
  @JsonKey(name: 'course')
  String get course => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes')
  int get likes => throw _privateConstructorUsedError;
  @JsonKey(name: 'existsSlide')
  bool get existsSlide => throw _privateConstructorUsedError;
  @JsonKey(name: 'existsReport')
  bool get existsReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'existsThesis')
  bool get existsThesis => throw _privateConstructorUsedError;
  @JsonKey(name: 'existsPoster')
  bool get existsPoster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchedCopyWith<Searched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchedCopyWith<$Res> {
  factory $SearchedCopyWith(Searched value, $Res Function(Searched) then) =
      _$SearchedCopyWithImpl<$Res, Searched>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category1') String category1,
      @JsonKey(name: 'category2') String category2,
      @JsonKey(name: 'subCategory1') String subCategory1,
      @JsonKey(name: 'subCategory2') String subCategory2,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'eventName') String eventName,
      @JsonKey(name: 'course') String course,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'likes') int likes,
      @JsonKey(name: 'existsSlide') bool existsSlide,
      @JsonKey(name: 'existsReport') bool existsReport,
      @JsonKey(name: 'existsThesis') bool existsThesis,
      @JsonKey(name: 'existsPoster') bool existsPoster});
}

/// @nodoc
class _$SearchedCopyWithImpl<$Res, $Val extends Searched>
    implements $SearchedCopyWith<$Res> {
  _$SearchedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category1 = null,
    Object? category2 = null,
    Object? subCategory1 = null,
    Object? subCategory2 = null,
    Object? year = null,
    Object? eventName = null,
    Object? course = null,
    Object? title = null,
    Object? author = null,
    Object? likes = null,
    Object? existsSlide = null,
    Object? existsReport = null,
    Object? existsThesis = null,
    Object? existsPoster = null,
  }) {
    return _then(_value.copyWith(
      category1: null == category1
          ? _value.category1
          : category1 // ignore: cast_nullable_to_non_nullable
              as String,
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory2: null == subCategory2
          ? _value.subCategory2
          : subCategory2 // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'category1') String category1,
      @JsonKey(name: 'category2') String category2,
      @JsonKey(name: 'subCategory1') String subCategory1,
      @JsonKey(name: 'subCategory2') String subCategory2,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'eventName') String eventName,
      @JsonKey(name: 'course') String course,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'author') String author,
      @JsonKey(name: 'likes') int likes,
      @JsonKey(name: 'existsSlide') bool existsSlide,
      @JsonKey(name: 'existsReport') bool existsReport,
      @JsonKey(name: 'existsThesis') bool existsThesis,
      @JsonKey(name: 'existsPoster') bool existsPoster});
}

/// @nodoc
class __$$SearchedImplCopyWithImpl<$Res>
    extends _$SearchedCopyWithImpl<$Res, _$SearchedImpl>
    implements _$$SearchedImplCopyWith<$Res> {
  __$$SearchedImplCopyWithImpl(
      _$SearchedImpl _value, $Res Function(_$SearchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category1 = null,
    Object? category2 = null,
    Object? subCategory1 = null,
    Object? subCategory2 = null,
    Object? year = null,
    Object? eventName = null,
    Object? course = null,
    Object? title = null,
    Object? author = null,
    Object? likes = null,
    Object? existsSlide = null,
    Object? existsReport = null,
    Object? existsThesis = null,
    Object? existsPoster = null,
  }) {
    return _then(_$SearchedImpl(
      category1: null == category1
          ? _value.category1
          : category1 // ignore: cast_nullable_to_non_nullable
              as String,
      category2: null == category2
          ? _value.category2
          : category2 // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory2: null == subCategory2
          ? _value.subCategory2
          : subCategory2 // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchedImpl extends _Searched {
  const _$SearchedImpl(
      {@JsonKey(name: 'category1') required this.category1,
      @JsonKey(name: 'category2') required this.category2,
      @JsonKey(name: 'subCategory1') required this.subCategory1,
      @JsonKey(name: 'subCategory2') required this.subCategory2,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'eventName') required this.eventName,
      @JsonKey(name: 'course') required this.course,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'likes') required this.likes,
      @JsonKey(name: 'existsSlide') required this.existsSlide,
      @JsonKey(name: 'existsReport') required this.existsReport,
      @JsonKey(name: 'existsThesis') required this.existsThesis,
      @JsonKey(name: 'existsPoster') required this.existsPoster})
      : super._();

  factory _$SearchedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchedImplFromJson(json);

  @override
  @JsonKey(name: 'category1')
  final String category1;
  @override
  @JsonKey(name: 'category2')
  final String category2;
  @override
  @JsonKey(name: 'subCategory1')
  final String subCategory1;
  @override
  @JsonKey(name: 'subCategory2')
  final String subCategory2;
  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'eventName')
  final String eventName;
  @override
  @JsonKey(name: 'course')
  final String course;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'author')
  final String author;
  @override
  @JsonKey(name: 'likes')
  final int likes;
  @override
  @JsonKey(name: 'existsSlide')
  final bool existsSlide;
  @override
  @JsonKey(name: 'existsReport')
  final bool existsReport;
  @override
  @JsonKey(name: 'existsThesis')
  final bool existsThesis;
  @override
  @JsonKey(name: 'existsPoster')
  final bool existsPoster;

  @override
  String toString() {
    return 'Searched(category1: $category1, category2: $category2, subCategory1: $subCategory1, subCategory2: $subCategory2, year: $year, eventName: $eventName, course: $course, title: $title, author: $author, likes: $likes, existsSlide: $existsSlide, existsReport: $existsReport, existsThesis: $existsThesis, existsPoster: $existsPoster)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedImpl &&
            (identical(other.category1, category1) ||
                other.category1 == category1) &&
            (identical(other.category2, category2) ||
                other.category2 == category2) &&
            (identical(other.subCategory1, subCategory1) ||
                other.subCategory1 == subCategory1) &&
            (identical(other.subCategory2, subCategory2) ||
                other.subCategory2 == subCategory2) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.existsSlide, existsSlide) ||
                other.existsSlide == existsSlide) &&
            (identical(other.existsReport, existsReport) ||
                other.existsReport == existsReport) &&
            (identical(other.existsThesis, existsThesis) ||
                other.existsThesis == existsThesis) &&
            (identical(other.existsPoster, existsPoster) ||
                other.existsPoster == existsPoster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category1,
      category2,
      subCategory1,
      subCategory2,
      year,
      eventName,
      course,
      title,
      author,
      likes,
      existsSlide,
      existsReport,
      existsThesis,
      existsPoster);

  @JsonKey(ignore: true)
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
          {@JsonKey(name: 'category1') required final String category1,
          @JsonKey(name: 'category2') required final String category2,
          @JsonKey(name: 'subCategory1') required final String subCategory1,
          @JsonKey(name: 'subCategory2') required final String subCategory2,
          @JsonKey(name: 'year') required final int year,
          @JsonKey(name: 'eventName') required final String eventName,
          @JsonKey(name: 'course') required final String course,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'author') required final String author,
          @JsonKey(name: 'likes') required final int likes,
          @JsonKey(name: 'existsSlide') required final bool existsSlide,
          @JsonKey(name: 'existsReport') required final bool existsReport,
          @JsonKey(name: 'existsThesis') required final bool existsThesis,
          @JsonKey(name: 'existsPoster') required final bool existsPoster}) =
      _$SearchedImpl;
  const _Searched._() : super._();

  factory _Searched.fromJson(Map<String, dynamic> json) =
      _$SearchedImpl.fromJson;

  @override
  @JsonKey(name: 'category1')
  String get category1;
  @override
  @JsonKey(name: 'category2')
  String get category2;
  @override
  @JsonKey(name: 'subCategory1')
  String get subCategory1;
  @override
  @JsonKey(name: 'subCategory2')
  String get subCategory2;
  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'eventName')
  String get eventName;
  @override
  @JsonKey(name: 'course')
  String get course;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'author')
  String get author;
  @override
  @JsonKey(name: 'likes')
  int get likes;
  @override
  @JsonKey(name: 'existsSlide')
  bool get existsSlide;
  @override
  @JsonKey(name: 'existsReport')
  bool get existsReport;
  @override
  @JsonKey(name: 'existsThesis')
  bool get existsThesis;
  @override
  @JsonKey(name: 'existsPoster')
  bool get existsPoster;
  @override
  @JsonKey(ignore: true)
  _$$SearchedImplCopyWith<_$SearchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
