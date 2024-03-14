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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get failureMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) networkFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? networkFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? networkFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
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
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$ServerFailureImpl(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl implements _ServerFailure {
  const _$ServerFailureImpl({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.serverFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) networkFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return serverFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? networkFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return serverFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? networkFailure,
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
    required TResult Function(_NetworkFailure value) networkFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
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
      _$ServerFailureImpl;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$NetworkFailureImpl(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements _NetworkFailure {
  const _$NetworkFailureImpl({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.networkFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) networkFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return networkFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? networkFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return networkFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? networkFailure,
    TResult Function(String failureMessage)? scrapFailure,
    TResult Function(String failureMessage)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_NetworkFailure value) networkFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return networkFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return networkFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
    TResult Function(_ScrapFailure value)? scrapFailure,
    TResult Function(_LocalAuthFailure value)? localAuthFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(this);
    }
    return orElse();
  }
}

abstract class _NetworkFailure implements Failure {
  const factory _NetworkFailure({required final String failureMessage}) =
      _$NetworkFailureImpl;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrapFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ScrapFailureImplCopyWith(
          _$ScrapFailureImpl value, $Res Function(_$ScrapFailureImpl) then) =
      __$$ScrapFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$ScrapFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ScrapFailureImpl>
    implements _$$ScrapFailureImplCopyWith<$Res> {
  __$$ScrapFailureImplCopyWithImpl(
      _$ScrapFailureImpl _value, $Res Function(_$ScrapFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$ScrapFailureImpl(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScrapFailureImpl implements _ScrapFailure {
  const _$ScrapFailureImpl({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.scrapFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrapFailureImpl &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrapFailureImplCopyWith<_$ScrapFailureImpl> get copyWith =>
      __$$ScrapFailureImplCopyWithImpl<_$ScrapFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) networkFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return scrapFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? networkFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return scrapFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? networkFailure,
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
    required TResult Function(_NetworkFailure value) networkFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return scrapFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return scrapFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
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
      _$ScrapFailureImpl;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$ScrapFailureImplCopyWith<_$ScrapFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalAuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$LocalAuthFailureImplCopyWith(_$LocalAuthFailureImpl value,
          $Res Function(_$LocalAuthFailureImpl) then) =
      __$$LocalAuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$LocalAuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LocalAuthFailureImpl>
    implements _$$LocalAuthFailureImplCopyWith<$Res> {
  __$$LocalAuthFailureImplCopyWithImpl(_$LocalAuthFailureImpl _value,
      $Res Function(_$LocalAuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$LocalAuthFailureImpl(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocalAuthFailureImpl implements _LocalAuthFailure {
  const _$LocalAuthFailureImpl({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'Failure.localAuthFailure(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalAuthFailureImpl &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalAuthFailureImplCopyWith<_$LocalAuthFailureImpl> get copyWith =>
      __$$LocalAuthFailureImplCopyWithImpl<_$LocalAuthFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failureMessage) serverFailure,
    required TResult Function(String failureMessage) networkFailure,
    required TResult Function(String failureMessage) scrapFailure,
    required TResult Function(String failureMessage) localAuthFailure,
  }) {
    return localAuthFailure(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failureMessage)? serverFailure,
    TResult? Function(String failureMessage)? networkFailure,
    TResult? Function(String failureMessage)? scrapFailure,
    TResult? Function(String failureMessage)? localAuthFailure,
  }) {
    return localAuthFailure?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failureMessage)? serverFailure,
    TResult Function(String failureMessage)? networkFailure,
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
    required TResult Function(_NetworkFailure value) networkFailure,
    required TResult Function(_ScrapFailure value) scrapFailure,
    required TResult Function(_LocalAuthFailure value) localAuthFailure,
  }) {
    return localAuthFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_NetworkFailure value)? networkFailure,
    TResult? Function(_ScrapFailure value)? scrapFailure,
    TResult? Function(_LocalAuthFailure value)? localAuthFailure,
  }) {
    return localAuthFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_NetworkFailure value)? networkFailure,
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
      _$LocalAuthFailureImpl;

  @override
  String get failureMessage;
  @override
  @JsonKey(ignore: true)
  _$$LocalAuthFailureImplCopyWith<_$LocalAuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
