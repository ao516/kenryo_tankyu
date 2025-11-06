// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Auth {
  @AffiliationConverter()
  Affiliation? get affiliation;
  String? get email;
  String? get password;
  String? get userName;
  bool get confirmVerifyEmail;
  int get limit;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthCopyWith<Auth> get copyWith =>
      _$AuthCopyWithImpl<Auth>(this as Auth, _$identity);

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Auth &&
            (identical(other.affiliation, affiliation) ||
                other.affiliation == affiliation) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.confirmVerifyEmail, confirmVerifyEmail) ||
                other.confirmVerifyEmail == confirmVerifyEmail) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, affiliation, email, password,
      userName, confirmVerifyEmail, limit);

  @override
  String toString() {
    return 'Auth(affiliation: $affiliation, email: $email, password: $password, userName: $userName, confirmVerifyEmail: $confirmVerifyEmail, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) _then) =
      _$AuthCopyWithImpl;
  @useResult
  $Res call(
      {@AffiliationConverter() Affiliation? affiliation,
      String? email,
      String? password,
      String? userName,
      bool confirmVerifyEmail,
      int limit});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._self, this._then);

  final Auth _self;
  final $Res Function(Auth) _then;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affiliation = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? confirmVerifyEmail = null,
    Object? limit = null,
  }) {
    return _then(_self.copyWith(
      affiliation: freezed == affiliation
          ? _self.affiliation
          : affiliation // ignore: cast_nullable_to_non_nullable
              as Affiliation?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmVerifyEmail: null == confirmVerifyEmail
          ? _self.confirmVerifyEmail
          : confirmVerifyEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Auth].
extension AuthPatterns on Auth {
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
    TResult Function(_Auth value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
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
    TResult Function(_Auth value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth():
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
    TResult? Function(_Auth value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
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
            @AffiliationConverter() Affiliation? affiliation,
            String? email,
            String? password,
            String? userName,
            bool confirmVerifyEmail,
            int limit)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
        return $default(_that.affiliation, _that.email, _that.password,
            _that.userName, _that.confirmVerifyEmail, _that.limit);
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
            @AffiliationConverter() Affiliation? affiliation,
            String? email,
            String? password,
            String? userName,
            bool confirmVerifyEmail,
            int limit)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth():
        return $default(_that.affiliation, _that.email, _that.password,
            _that.userName, _that.confirmVerifyEmail, _that.limit);
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
            @AffiliationConverter() Affiliation? affiliation,
            String? email,
            String? password,
            String? userName,
            bool confirmVerifyEmail,
            int limit)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Auth() when $default != null:
        return $default(_that.affiliation, _that.email, _that.password,
            _that.userName, _that.confirmVerifyEmail, _that.limit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Auth implements Auth {
  const _Auth(
      {@AffiliationConverter() this.affiliation,
      this.email,
      this.password,
      this.userName,
      this.confirmVerifyEmail = false,
      this.limit = 5});
  factory _Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  @override
  @AffiliationConverter()
  final Affiliation? affiliation;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? userName;
  @override
  @JsonKey()
  final bool confirmVerifyEmail;
  @override
  @JsonKey()
  final int limit;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Auth &&
            (identical(other.affiliation, affiliation) ||
                other.affiliation == affiliation) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.confirmVerifyEmail, confirmVerifyEmail) ||
                other.confirmVerifyEmail == confirmVerifyEmail) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, affiliation, email, password,
      userName, confirmVerifyEmail, limit);

  @override
  String toString() {
    return 'Auth(affiliation: $affiliation, email: $email, password: $password, userName: $userName, confirmVerifyEmail: $confirmVerifyEmail, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) _then) =
      __$AuthCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@AffiliationConverter() Affiliation? affiliation,
      String? email,
      String? password,
      String? userName,
      bool confirmVerifyEmail,
      int limit});
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(this._self, this._then);

  final _Auth _self;
  final $Res Function(_Auth) _then;

  /// Create a copy of Auth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? affiliation = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? confirmVerifyEmail = null,
    Object? limit = null,
  }) {
    return _then(_Auth(
      affiliation: freezed == affiliation
          ? _self.affiliation
          : affiliation // ignore: cast_nullable_to_non_nullable
              as Affiliation?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmVerifyEmail: null == confirmVerifyEmail
          ? _self.confirmVerifyEmail
          : confirmVerifyEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
