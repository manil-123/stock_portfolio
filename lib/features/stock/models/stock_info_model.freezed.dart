// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockInfoModel _$StockInfoModelFromJson(Map<String, dynamic> json) {
  return _StockInfoModel.fromJson(json);
}

/// @nodoc
mixin _$StockInfoModel {
  String get companyName => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get ltp => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockInfoModelCopyWith<StockInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoModelCopyWith<$Res> {
  factory $StockInfoModelCopyWith(
          StockInfoModel value, $Res Function(StockInfoModel) then) =
      _$StockInfoModelCopyWithImpl<$Res, StockInfoModel>;
  @useResult
  $Res call({String companyName, String symbol, String ltp, String change});
}

/// @nodoc
class _$StockInfoModelCopyWithImpl<$Res, $Val extends StockInfoModel>
    implements $StockInfoModelCopyWith<$Res> {
  _$StockInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? symbol = null,
    Object? ltp = null,
    Object? change = null,
  }) {
    return _then(_value.copyWith(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      ltp: null == ltp
          ? _value.ltp
          : ltp // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockInfoModelImplCopyWith<$Res>
    implements $StockInfoModelCopyWith<$Res> {
  factory _$$StockInfoModelImplCopyWith(_$StockInfoModelImpl value,
          $Res Function(_$StockInfoModelImpl) then) =
      __$$StockInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String companyName, String symbol, String ltp, String change});
}

/// @nodoc
class __$$StockInfoModelImplCopyWithImpl<$Res>
    extends _$StockInfoModelCopyWithImpl<$Res, _$StockInfoModelImpl>
    implements _$$StockInfoModelImplCopyWith<$Res> {
  __$$StockInfoModelImplCopyWithImpl(
      _$StockInfoModelImpl _value, $Res Function(_$StockInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? symbol = null,
    Object? ltp = null,
    Object? change = null,
  }) {
    return _then(_$StockInfoModelImpl(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      ltp: null == ltp
          ? _value.ltp
          : ltp // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockInfoModelImpl implements _StockInfoModel {
  const _$StockInfoModelImpl(
      {required this.companyName,
      required this.symbol,
      required this.ltp,
      required this.change});

  factory _$StockInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockInfoModelImplFromJson(json);

  @override
  final String companyName;
  @override
  final String symbol;
  @override
  final String ltp;
  @override
  final String change;

  @override
  String toString() {
    return 'StockInfoModel(companyName: $companyName, symbol: $symbol, ltp: $ltp, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockInfoModelImpl &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.ltp, ltp) || other.ltp == ltp) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, companyName, symbol, ltp, change);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockInfoModelImplCopyWith<_$StockInfoModelImpl> get copyWith =>
      __$$StockInfoModelImplCopyWithImpl<_$StockInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockInfoModelImplToJson(
      this,
    );
  }
}

abstract class _StockInfoModel implements StockInfoModel {
  const factory _StockInfoModel(
      {required final String companyName,
      required final String symbol,
      required final String ltp,
      required final String change}) = _$StockInfoModelImpl;

  factory _StockInfoModel.fromJson(Map<String, dynamic> json) =
      _$StockInfoModelImpl.fromJson;

  @override
  String get companyName;
  @override
  String get symbol;
  @override
  String get ltp;
  @override
  String get change;
  @override
  @JsonKey(ignore: true)
  _$$StockInfoModelImplCopyWith<_$StockInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
