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

/// @nodoc
mixin _$Search {
  String? get category => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String? get departure => throw _privateConstructorUsedError;
  List<Map<String, String>>? get searchWord =>
      throw _privateConstructorUsedError;

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
      String? year,
      String? eventName,
      String? departure,
      List<Map<String, String>>? searchWord});
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
    Object? departure = freezed,
    Object? searchWord = freezed,
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
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>?,
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
      String? year,
      String? eventName,
      String? departure,
      List<Map<String, String>>? searchWord});
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
    Object? departure = freezed,
    Object? searchWord = freezed,
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
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as String?,
      searchWord: freezed == searchWord
          ? _value._searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>?,
    ));
  }
}

/// @nodoc

class _$SearchImpl with DiagnosticableTreeMixin implements _Search {
  const _$SearchImpl(
      {this.category,
      this.subCategory,
      this.year,
      this.eventName,
      this.departure,
      final List<Map<String, String>>? searchWord})
      : _searchWord = searchWord;

  @override
  final String? category;
  @override
  final String? subCategory;
  @override
  final String? year;
  @override
  final String? eventName;
  @override
  final String? departure;
  final List<Map<String, String>>? _searchWord;
  @override
  List<Map<String, String>>? get searchWord {
    final value = _searchWord;
    if (value == null) return null;
    if (_searchWord is EqualUnmodifiableListView) return _searchWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Search(category: $category, subCategory: $subCategory, year: $year, eventName: $eventName, departure: $departure, searchWord: $searchWord)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Search'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('subCategory', subCategory))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('eventName', eventName))
      ..add(DiagnosticsProperty('departure', departure))
      ..add(DiagnosticsProperty('searchWord', searchWord));
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
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            const DeepCollectionEquality()
                .equals(other._searchWord, _searchWord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, subCategory, year,
      eventName, departure, const DeepCollectionEquality().hash(_searchWord));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);
}

abstract class _Search implements Search {
  const factory _Search(
      {final String? category,
      final String? subCategory,
      final String? year,
      final String? eventName,
      final String? departure,
      final List<Map<String, String>>? searchWord}) = _$SearchImpl;

  @override
  String? get category;
  @override
  String? get subCategory;
  @override
  String? get year;
  @override
  String? get eventName;
  @override
  String? get departure;
  @override
  List<Map<String, String>>? get searchWord;
  @override
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
