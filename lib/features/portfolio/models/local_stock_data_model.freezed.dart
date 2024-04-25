// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_stock_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalStockDataModel _$LocalStockDataModelFromJson(Map<String, dynamic> json) {
  return _LocalStockDataModel.fromJson(json);
}

/// @nodoc
mixin _$LocalStockDataModel {
  int? get id => throw _privateConstructorUsedError;
  String get scrip => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get sectorName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalStockDataModelCopyWith<LocalStockDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalStockDataModelCopyWith<$Res> {
  factory $LocalStockDataModelCopyWith(
          LocalStockDataModel value, $Res Function(LocalStockDataModel) then) =
      _$LocalStockDataModelCopyWithImpl<$Res, LocalStockDataModel>;
  @useResult
  $Res call(
      {int? id,
      String scrip,
      String companyName,
      String sectorName,
      int quantity,
      double price});
}

/// @nodoc
class _$LocalStockDataModelCopyWithImpl<$Res, $Val extends LocalStockDataModel>
    implements $LocalStockDataModelCopyWith<$Res> {
  _$LocalStockDataModelCopyWithImpl(this._value, this._then);

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
    Object? quantity = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalStockDataModelImplCopyWith<$Res>
    implements $LocalStockDataModelCopyWith<$Res> {
  factory _$$LocalStockDataModelImplCopyWith(_$LocalStockDataModelImpl value,
          $Res Function(_$LocalStockDataModelImpl) then) =
      __$$LocalStockDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String scrip,
      String companyName,
      String sectorName,
      int quantity,
      double price});
}

/// @nodoc
class __$$LocalStockDataModelImplCopyWithImpl<$Res>
    extends _$LocalStockDataModelCopyWithImpl<$Res, _$LocalStockDataModelImpl>
    implements _$$LocalStockDataModelImplCopyWith<$Res> {
  __$$LocalStockDataModelImplCopyWithImpl(_$LocalStockDataModelImpl _value,
      $Res Function(_$LocalStockDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? scrip = null,
    Object? companyName = null,
    Object? sectorName = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$LocalStockDataModelImpl(
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalStockDataModelImpl implements _LocalStockDataModel {
  const _$LocalStockDataModelImpl(
      {this.id,
      required this.scrip,
      required this.companyName,
      required this.sectorName,
      required this.quantity,
      required this.price});

  factory _$LocalStockDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalStockDataModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String scrip;
  @override
  final String companyName;
  @override
  final String sectorName;
  @override
  final int quantity;
  @override
  final double price;

  @override
  String toString() {
    return 'LocalStockDataModel(id: $id, scrip: $scrip, companyName: $companyName, sectorName: $sectorName, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalStockDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scrip, scrip) || other.scrip == scrip) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.sectorName, sectorName) ||
                other.sectorName == sectorName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, scrip, companyName, sectorName, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalStockDataModelImplCopyWith<_$LocalStockDataModelImpl> get copyWith =>
      __$$LocalStockDataModelImplCopyWithImpl<_$LocalStockDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalStockDataModelImplToJson(
      this,
    );
  }
}

abstract class _LocalStockDataModel implements LocalStockDataModel {
  const factory _LocalStockDataModel(
      {final int? id,
      required final String scrip,
      required final String companyName,
      required final String sectorName,
      required final int quantity,
      required final double price}) = _$LocalStockDataModelImpl;

  factory _LocalStockDataModel.fromJson(Map<String, dynamic> json) =
      _$LocalStockDataModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get scrip;
  @override
  String get companyName;
  @override
  String get sectorName;
  @override
  int get quantity;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$LocalStockDataModelImplCopyWith<_$LocalStockDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
