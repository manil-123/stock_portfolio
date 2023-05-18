// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_losers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopLosersModel _$TopLosersModelFromJson(Map<String, dynamic> json) {
  return _TopLosersModel.fromJson(json);
}

/// @nodoc
mixin _$TopLosersModel {
  String get companyName => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get ltp => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopLosersModelCopyWith<TopLosersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopLosersModelCopyWith<$Res> {
  factory $TopLosersModelCopyWith(
          TopLosersModel value, $Res Function(TopLosersModel) then) =
      _$TopLosersModelCopyWithImpl<$Res, TopLosersModel>;
  @useResult
  $Res call(
      {String companyName,
      String symbol,
      String ltp,
      String change,
      String quantity});
}

/// @nodoc
class _$TopLosersModelCopyWithImpl<$Res, $Val extends TopLosersModel>
    implements $TopLosersModelCopyWith<$Res> {
  _$TopLosersModelCopyWithImpl(this._value, this._then);

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
    Object? quantity = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopLosersModelCopyWith<$Res>
    implements $TopLosersModelCopyWith<$Res> {
  factory _$$_TopLosersModelCopyWith(
          _$_TopLosersModel value, $Res Function(_$_TopLosersModel) then) =
      __$$_TopLosersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String companyName,
      String symbol,
      String ltp,
      String change,
      String quantity});
}

/// @nodoc
class __$$_TopLosersModelCopyWithImpl<$Res>
    extends _$TopLosersModelCopyWithImpl<$Res, _$_TopLosersModel>
    implements _$$_TopLosersModelCopyWith<$Res> {
  __$$_TopLosersModelCopyWithImpl(
      _$_TopLosersModel _value, $Res Function(_$_TopLosersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? symbol = null,
    Object? ltp = null,
    Object? change = null,
    Object? quantity = null,
  }) {
    return _then(_$_TopLosersModel(
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopLosersModel implements _TopLosersModel {
  const _$_TopLosersModel(
      {required this.companyName,
      required this.symbol,
      required this.ltp,
      required this.change,
      required this.quantity});

  factory _$_TopLosersModel.fromJson(Map<String, dynamic> json) =>
      _$$_TopLosersModelFromJson(json);

  @override
  final String companyName;
  @override
  final String symbol;
  @override
  final String ltp;
  @override
  final String change;
  @override
  final String quantity;

  @override
  String toString() {
    return 'TopLosersModel(companyName: $companyName, symbol: $symbol, ltp: $ltp, change: $change, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopLosersModel &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.ltp, ltp) || other.ltp == ltp) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, companyName, symbol, ltp, change, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopLosersModelCopyWith<_$_TopLosersModel> get copyWith =>
      __$$_TopLosersModelCopyWithImpl<_$_TopLosersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopLosersModelToJson(
      this,
    );
  }
}

abstract class _TopLosersModel implements TopLosersModel {
  const factory _TopLosersModel(
      {required final String companyName,
      required final String symbol,
      required final String ltp,
      required final String change,
      required final String quantity}) = _$_TopLosersModel;

  factory _TopLosersModel.fromJson(Map<String, dynamic> json) =
      _$_TopLosersModel.fromJson;

  @override
  String get companyName;
  @override
  String get symbol;
  @override
  String get ltp;
  @override
  String get change;
  @override
  String get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_TopLosersModelCopyWith<_$_TopLosersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
