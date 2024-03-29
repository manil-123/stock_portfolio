// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchlistDataModel _$WatchlistDataModelFromJson(Map<String, dynamic> json) {
  return _WatchlistDataModel.fromJson(json);
}

/// @nodoc
mixin _$WatchlistDataModel {
  int? get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get sectorName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistDataModelCopyWith<WatchlistDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistDataModelCopyWith<$Res> {
  factory $WatchlistDataModelCopyWith(
          WatchlistDataModel value, $Res Function(WatchlistDataModel) then) =
      _$WatchlistDataModelCopyWithImpl<$Res, WatchlistDataModel>;
  @useResult
  $Res call({int? id, String symbol, String companyName, String sectorName});
}

/// @nodoc
class _$WatchlistDataModelCopyWithImpl<$Res, $Val extends WatchlistDataModel>
    implements $WatchlistDataModelCopyWith<$Res> {
  _$WatchlistDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = null,
    Object? companyName = null,
    Object? sectorName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistDataModelImplCopyWith<$Res>
    implements $WatchlistDataModelCopyWith<$Res> {
  factory _$$WatchlistDataModelImplCopyWith(_$WatchlistDataModelImpl value,
          $Res Function(_$WatchlistDataModelImpl) then) =
      __$$WatchlistDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String symbol, String companyName, String sectorName});
}

/// @nodoc
class __$$WatchlistDataModelImplCopyWithImpl<$Res>
    extends _$WatchlistDataModelCopyWithImpl<$Res, _$WatchlistDataModelImpl>
    implements _$$WatchlistDataModelImplCopyWith<$Res> {
  __$$WatchlistDataModelImplCopyWithImpl(_$WatchlistDataModelImpl _value,
      $Res Function(_$WatchlistDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? symbol = null,
    Object? companyName = null,
    Object? sectorName = null,
  }) {
    return _then(_$WatchlistDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistDataModelImpl implements _WatchlistDataModel {
  const _$WatchlistDataModelImpl(
      {this.id,
      required this.symbol,
      required this.companyName,
      required this.sectorName});

  factory _$WatchlistDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistDataModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String symbol;
  @override
  final String companyName;
  @override
  final String sectorName;

  @override
  String toString() {
    return 'WatchlistDataModel(id: $id, symbol: $symbol, companyName: $companyName, sectorName: $sectorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, symbol, companyName, sectorName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistDataModelImplCopyWith<_$WatchlistDataModelImpl> get copyWith =>
      __$$WatchlistDataModelImplCopyWithImpl<_$WatchlistDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistDataModelImplToJson(
      this,
    );
  }
}

abstract class _WatchlistDataModel implements WatchlistDataModel {
  const factory _WatchlistDataModel(
      {final int? id,
      required final String symbol,
      required final String companyName,
      required final String sectorName}) = _$WatchlistDataModelImpl;

  factory _WatchlistDataModel.fromJson(Map<String, dynamic> json) =
      _$WatchlistDataModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get symbol;
  @override
  String get companyName;
  @override
  String get sectorName;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistDataModelImplCopyWith<_$WatchlistDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
