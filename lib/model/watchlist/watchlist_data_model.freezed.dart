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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WatchlistDataModel _$WatchlistDataModelFromJson(Map<String, dynamic> json) {
  return _WatchlistDataModel.fromJson(json);
}

/// @nodoc
mixin _$WatchlistDataModel {
  int? get id => throw _privateConstructorUsedError;
  String get scrip => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get sectorName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

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
  $Res call(
      {int? id,
      String scrip,
      String companyName,
      String sectorName,
      double price});
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
    Object? scrip = null,
    Object? companyName = null,
    Object? sectorName = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      scrip: null == scrip
          ? _value.scrip
          : scrip // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WatchlistDataModelCopyWith<$Res>
    implements $WatchlistDataModelCopyWith<$Res> {
  factory _$$_WatchlistDataModelCopyWith(_$_WatchlistDataModel value,
          $Res Function(_$_WatchlistDataModel) then) =
      __$$_WatchlistDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String scrip,
      String companyName,
      String sectorName,
      double price});
}

/// @nodoc
class __$$_WatchlistDataModelCopyWithImpl<$Res>
    extends _$WatchlistDataModelCopyWithImpl<$Res, _$_WatchlistDataModel>
    implements _$$_WatchlistDataModelCopyWith<$Res> {
  __$$_WatchlistDataModelCopyWithImpl(
      _$_WatchlistDataModel _value, $Res Function(_$_WatchlistDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scrip = null,
    Object? companyName = null,
    Object? sectorName = null,
    Object? price = null,
  }) {
    return _then(_$_WatchlistDataModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      scrip: null == scrip
          ? _value.scrip
          : scrip // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      sectorName: null == sectorName
          ? _value.sectorName
          : sectorName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WatchlistDataModel implements _WatchlistDataModel {
  const _$_WatchlistDataModel(
      {this.id,
      required this.scrip,
      required this.companyName,
      required this.sectorName,
      required this.price});

  factory _$_WatchlistDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_WatchlistDataModelFromJson(json);

  @override
  final int? id;
  @override
  final String scrip;
  @override
  final String companyName;
  @override
  final String sectorName;
  @override
  final double price;

  @override
  String toString() {
    return 'WatchlistDataModel(id: $id, scrip: $scrip, companyName: $companyName, sectorName: $sectorName, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchlistDataModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scrip, scrip) || other.scrip == scrip) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, scrip, companyName, sectorName, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchlistDataModelCopyWith<_$_WatchlistDataModel> get copyWith =>
      __$$_WatchlistDataModelCopyWithImpl<_$_WatchlistDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WatchlistDataModelToJson(
      this,
    );
  }
}

abstract class _WatchlistDataModel implements WatchlistDataModel {
  const factory _WatchlistDataModel(
      {final int? id,
      required final String scrip,
      required final String companyName,
      required final String sectorName,
      required final double price}) = _$_WatchlistDataModel;

  factory _WatchlistDataModel.fromJson(Map<String, dynamic> json) =
      _$_WatchlistDataModel.fromJson;

  @override
  int? get id;
  @override
  String get scrip;
  @override
  String get companyName;
  @override
  String get sectorName;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_WatchlistDataModelCopyWith<_$_WatchlistDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
