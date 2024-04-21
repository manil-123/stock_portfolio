// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenericState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericInitial<T> value) initial,
    required TResult Function(GenericLoading<T> value) loading,
    required TResult Function(GenericSuccess<T> value) success,
    required TResult Function(_GenericError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericInitial<T> value)? initial,
    TResult? Function(GenericLoading<T> value)? loading,
    TResult? Function(GenericSuccess<T> value)? success,
    TResult? Function(_GenericError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericInitial<T> value)? initial,
    TResult Function(GenericLoading<T> value)? loading,
    TResult Function(GenericSuccess<T> value)? success,
    TResult Function(_GenericError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericStateCopyWith<T, $Res> {
  factory $GenericStateCopyWith(
          GenericState<T> value, $Res Function(GenericState<T>) then) =
      _$GenericStateCopyWithImpl<T, $Res, GenericState<T>>;
}

/// @nodoc
class _$GenericStateCopyWithImpl<T, $Res, $Val extends GenericState<T>>
    implements $GenericStateCopyWith<T, $Res> {
  _$GenericStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GenericInitialImplCopyWith<T, $Res> {
  factory _$$GenericInitialImplCopyWith(_$GenericInitialImpl<T> value,
          $Res Function(_$GenericInitialImpl<T>) then) =
      __$$GenericInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenericInitialImplCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericInitialImpl<T>>
    implements _$$GenericInitialImplCopyWith<T, $Res> {
  __$$GenericInitialImplCopyWithImpl(_$GenericInitialImpl<T> _value,
      $Res Function(_$GenericInitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenericInitialImpl<T> implements _GenericInitial<T> {
  const _$GenericInitialImpl();

  @override
  String toString() {
    return 'GenericState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericInitial<T> value) initial,
    required TResult Function(GenericLoading<T> value) loading,
    required TResult Function(GenericSuccess<T> value) success,
    required TResult Function(_GenericError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericInitial<T> value)? initial,
    TResult? Function(GenericLoading<T> value)? loading,
    TResult? Function(GenericSuccess<T> value)? success,
    TResult? Function(_GenericError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericInitial<T> value)? initial,
    TResult Function(GenericLoading<T> value)? loading,
    TResult Function(GenericSuccess<T> value)? success,
    TResult Function(_GenericError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _GenericInitial<T> implements GenericState<T> {
  const factory _GenericInitial() = _$GenericInitialImpl<T>;
}

/// @nodoc
abstract class _$$GenericLoadingImplCopyWith<T, $Res> {
  factory _$$GenericLoadingImplCopyWith(_$GenericLoadingImpl<T> value,
          $Res Function(_$GenericLoadingImpl<T>) then) =
      __$$GenericLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenericLoadingImplCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericLoadingImpl<T>>
    implements _$$GenericLoadingImplCopyWith<T, $Res> {
  __$$GenericLoadingImplCopyWithImpl(_$GenericLoadingImpl<T> _value,
      $Res Function(_$GenericLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenericLoadingImpl<T> implements GenericLoading<T> {
  const _$GenericLoadingImpl();

  @override
  String toString() {
    return 'GenericState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericInitial<T> value) initial,
    required TResult Function(GenericLoading<T> value) loading,
    required TResult Function(GenericSuccess<T> value) success,
    required TResult Function(_GenericError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericInitial<T> value)? initial,
    TResult? Function(GenericLoading<T> value)? loading,
    TResult? Function(GenericSuccess<T> value)? success,
    TResult? Function(_GenericError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericInitial<T> value)? initial,
    TResult Function(GenericLoading<T> value)? loading,
    TResult Function(GenericSuccess<T> value)? success,
    TResult Function(_GenericError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GenericLoading<T> implements GenericState<T> {
  const factory GenericLoading() = _$GenericLoadingImpl<T>;
}

/// @nodoc
abstract class _$$GenericSuccessImplCopyWith<T, $Res> {
  factory _$$GenericSuccessImplCopyWith(_$GenericSuccessImpl<T> value,
          $Res Function(_$GenericSuccessImpl<T>) then) =
      __$$GenericSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$GenericSuccessImplCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericSuccessImpl<T>>
    implements _$$GenericSuccessImplCopyWith<T, $Res> {
  __$$GenericSuccessImplCopyWithImpl(_$GenericSuccessImpl<T> _value,
      $Res Function(_$GenericSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GenericSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$GenericSuccessImpl<T> implements GenericSuccess<T> {
  const _$GenericSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'GenericState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericSuccessImplCopyWith<T, _$GenericSuccessImpl<T>> get copyWith =>
      __$$GenericSuccessImplCopyWithImpl<T, _$GenericSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericInitial<T> value) initial,
    required TResult Function(GenericLoading<T> value) loading,
    required TResult Function(GenericSuccess<T> value) success,
    required TResult Function(_GenericError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericInitial<T> value)? initial,
    TResult? Function(GenericLoading<T> value)? loading,
    TResult? Function(GenericSuccess<T> value)? success,
    TResult? Function(_GenericError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericInitial<T> value)? initial,
    TResult Function(GenericLoading<T> value)? loading,
    TResult Function(GenericSuccess<T> value)? success,
    TResult Function(_GenericError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GenericSuccess<T> implements GenericState<T> {
  const factory GenericSuccess(final T data) = _$GenericSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$GenericSuccessImplCopyWith<T, _$GenericSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericErrorImplCopyWith<T, $Res> {
  factory _$$GenericErrorImplCopyWith(_$GenericErrorImpl<T> value,
          $Res Function(_$GenericErrorImpl<T>) then) =
      __$$GenericErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GenericErrorImplCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericErrorImpl<T>>
    implements _$$GenericErrorImplCopyWith<T, $Res> {
  __$$GenericErrorImplCopyWithImpl(
      _$GenericErrorImpl<T> _value, $Res Function(_$GenericErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GenericErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GenericErrorImpl<T> implements _GenericError<T> {
  const _$GenericErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GenericState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericErrorImplCopyWith<T, _$GenericErrorImpl<T>> get copyWith =>
      __$$GenericErrorImplCopyWithImpl<T, _$GenericErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GenericInitial<T> value) initial,
    required TResult Function(GenericLoading<T> value) loading,
    required TResult Function(GenericSuccess<T> value) success,
    required TResult Function(_GenericError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GenericInitial<T> value)? initial,
    TResult? Function(GenericLoading<T> value)? loading,
    TResult? Function(GenericSuccess<T> value)? success,
    TResult? Function(_GenericError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GenericInitial<T> value)? initial,
    TResult Function(GenericLoading<T> value)? loading,
    TResult Function(GenericSuccess<T> value)? success,
    TResult Function(_GenericError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GenericError<T> implements GenericState<T> {
  const factory _GenericError({required final String message}) =
      _$GenericErrorImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$GenericErrorImplCopyWith<T, _$GenericErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
