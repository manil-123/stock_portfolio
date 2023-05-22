// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_add_stock_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadAddStockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadAddStockStateCopyWith<$Res> {
  factory $LoadAddStockStateCopyWith(
          LoadAddStockState value, $Res Function(LoadAddStockState) then) =
      _$LoadAddStockStateCopyWithImpl<$Res, LoadAddStockState>;
}

/// @nodoc
class _$LoadAddStockStateCopyWithImpl<$Res, $Val extends LoadAddStockState>
    implements $LoadAddStockStateCopyWith<$Res> {
  _$LoadAddStockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LoadAddStockStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LoadAddStockState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoadAddStockState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> sectorNames,
      List<String> companyNames,
      Map<String, String> scripCompanyNameMap,
      Map<String, String> companySectorNameMap,
      MarketEnum selectedMarket});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$LoadAddStockStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectorNames = null,
    Object? companyNames = null,
    Object? scripCompanyNameMap = null,
    Object? companySectorNameMap = null,
    Object? selectedMarket = null,
  }) {
    return _then(_$_Loaded(
      sectorNames: null == sectorNames
          ? _value._sectorNames
          : sectorNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      companyNames: null == companyNames
          ? _value._companyNames
          : companyNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scripCompanyNameMap: null == scripCompanyNameMap
          ? _value._scripCompanyNameMap
          : scripCompanyNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      companySectorNameMap: null == companySectorNameMap
          ? _value._companySectorNameMap
          : companySectorNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      selectedMarket: null == selectedMarket
          ? _value.selectedMarket
          : selectedMarket // ignore: cast_nullable_to_non_nullable
              as MarketEnum,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<String> sectorNames,
      required final List<String> companyNames,
      required final Map<String, String> scripCompanyNameMap,
      required final Map<String, String> companySectorNameMap,
      required this.selectedMarket})
      : _sectorNames = sectorNames,
        _companyNames = companyNames,
        _scripCompanyNameMap = scripCompanyNameMap,
        _companySectorNameMap = companySectorNameMap;

  final List<String> _sectorNames;
  @override
  List<String> get sectorNames {
    if (_sectorNames is EqualUnmodifiableListView) return _sectorNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sectorNames);
  }

  final List<String> _companyNames;
  @override
  List<String> get companyNames {
    if (_companyNames is EqualUnmodifiableListView) return _companyNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companyNames);
  }

  final Map<String, String> _scripCompanyNameMap;
  @override
  Map<String, String> get scripCompanyNameMap {
    if (_scripCompanyNameMap is EqualUnmodifiableMapView)
      return _scripCompanyNameMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_scripCompanyNameMap);
  }

  final Map<String, String> _companySectorNameMap;
  @override
  Map<String, String> get companySectorNameMap {
    if (_companySectorNameMap is EqualUnmodifiableMapView)
      return _companySectorNameMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_companySectorNameMap);
  }

  @override
  final MarketEnum selectedMarket;

  @override
  String toString() {
    return 'LoadAddStockState.loaded(sectorNames: $sectorNames, companyNames: $companyNames, scripCompanyNameMap: $scripCompanyNameMap, companySectorNameMap: $companySectorNameMap, selectedMarket: $selectedMarket)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._sectorNames, _sectorNames) &&
            const DeepCollectionEquality()
                .equals(other._companyNames, _companyNames) &&
            const DeepCollectionEquality()
                .equals(other._scripCompanyNameMap, _scripCompanyNameMap) &&
            const DeepCollectionEquality()
                .equals(other._companySectorNameMap, _companySectorNameMap) &&
            (identical(other.selectedMarket, selectedMarket) ||
                other.selectedMarket == selectedMarket));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sectorNames),
      const DeepCollectionEquality().hash(_companyNames),
      const DeepCollectionEquality().hash(_scripCompanyNameMap),
      const DeepCollectionEquality().hash(_companySectorNameMap),
      selectedMarket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)
        loaded,
  }) {
    return loaded(sectorNames, companyNames, scripCompanyNameMap,
        companySectorNameMap, selectedMarket);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
  }) {
    return loaded?.call(sectorNames, companyNames, scripCompanyNameMap,
        companySectorNameMap, selectedMarket);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<String> sectorNames,
            List<String> companyNames,
            Map<String, String> scripCompanyNameMap,
            Map<String, String> companySectorNameMap,
            MarketEnum selectedMarket)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sectorNames, companyNames, scripCompanyNameMap,
          companySectorNameMap, selectedMarket);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LoadAddStockState {
  const factory _Loaded(
      {required final List<String> sectorNames,
      required final List<String> companyNames,
      required final Map<String, String> scripCompanyNameMap,
      required final Map<String, String> companySectorNameMap,
      required final MarketEnum selectedMarket}) = _$_Loaded;

  List<String> get sectorNames;
  List<String> get companyNames;
  Map<String, String> get scripCompanyNameMap;
  Map<String, String> get companySectorNameMap;
  MarketEnum get selectedMarket;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
