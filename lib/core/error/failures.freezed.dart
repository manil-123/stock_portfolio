// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get failureMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_ScrapFailure value)? scrapFailure,
    TResult Function(_LocalAuthFailure value)? localAuthFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_value.copyWith(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_ServerFailureCopyWith(
          _$_ServerFailure value, $Res Function(_$_ServerFailure) then) =
      __$$_ServerFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$_ServerFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_ServerFailure>
    implements _$$_ServerFailureCopyWith<$Res> {
  __$$_ServerFailureCopyWithImpl(
      _$_ServerFailure _value, $Res Function(_$_ServerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$_ServerFailure(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerFailure implements _ServerFailure {
  const _$_ServerFailure({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.serverFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerFailure &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      __$$_ServerFailureCopyWithImpl<_$_ServerFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return serverFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return serverFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_ScrapFailure value)? scrapFailure,
    TResult Function(_LocalAuthFailure value)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure implements Failure {
  const factory _ServerFailure({required final String failureMessage}) =
      _$_ServerFailure;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrapFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_ScrapFailureCopyWith(
          _$_ScrapFailure value, $Res Function(_$_ScrapFailure) then) =
      __$$_ScrapFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$_ScrapFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_ScrapFailure>
    implements _$$_ScrapFailureCopyWith<$Res> {
  __$$_ScrapFailureCopyWithImpl(
      _$_ScrapFailure _value, $Res Function(_$_ScrapFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$_ScrapFailure(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ScrapFailure implements _ScrapFailure {
  const _$_ScrapFailure({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.scrapFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrapFailure &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrapFailureCopyWith<_$_ScrapFailure> get copyWith =>
      __$$_ScrapFailureCopyWithImpl<_$_ScrapFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return scrapFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return scrapFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (scrapFailure != null) {
      return scrapFailure(failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return scrapFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return scrapFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_ScrapFailure value)? scrapFailure,
    TResult Function(_LocalAuthFailure value)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (scrapFailure != null) {
      return scrapFailure(this);
    }
    return orElse();
  }
}

abstract class _ScrapFailure implements Failure {
  const factory _ScrapFailure({required final String failureMessage}) =
      _$_ScrapFailure;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ScrapFailureCopyWith<_$_ScrapFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LocalAuthFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_LocalAuthFailureCopyWith(
          _$_LocalAuthFailure value, $Res Function(_$_LocalAuthFailure) then) =
      __$$_LocalAuthFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$_LocalAuthFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_LocalAuthFailure>
    implements _$$_LocalAuthFailureCopyWith<$Res> {
  __$$_LocalAuthFailureCopyWithImpl(
      _$_LocalAuthFailure _value, $Res Function(_$_LocalAuthFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$_LocalAuthFailure(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocalAuthFailure implements _LocalAuthFailure {
  const _$_LocalAuthFailure({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.localAuthFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAuthFailure &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAuthFailureCopyWith<_$_LocalAuthFailure> get copyWith =>
      __$$_LocalAuthFailureCopyWithImpl<_$_LocalAuthFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return localAuthFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return localAuthFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (localAuthFailure != null) {
      return localAuthFailure(failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return localAuthFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return localAuthFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_ScrapFailure value)? scrapFailure,
    TResult Function(_LocalAuthFailure value)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (localAuthFailure != null) {
      return localAuthFailure(this);
    }
    return orElse();
  }
}

abstract class _LocalAuthFailure implements Failure {
  const factory _LocalAuthFailure({required final String failureMessage}) =
      _$_LocalAuthFailure;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAuthFailureCopyWith<_$_LocalAuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
