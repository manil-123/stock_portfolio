// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShareInfoModel _$ShareInfoModelFromJson(Map<String, dynamic> json) {
  return _ShareInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ShareInfoModel {
  String get companyName => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get ltp => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareInfoModelCopyWith<ShareInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareInfoModelCopyWith<$Res> {
  factory $ShareInfoModelCopyWith(
          ShareInfoModel value, $Res Function(ShareInfoModel) then) =
      _$ShareInfoModelCopyWithImpl<$Res, ShareInfoModel>;
  @useResult
  $Res call({String companyName, String symbol, String ltp, String change});
}

/// @nodoc
class _$ShareInfoModelCopyWithImpl<$Res, $Val extends ShareInfoModel>
    implements $ShareInfoModelCopyWith<$Res> {
  _$ShareInfoModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_ShareInfoModelCopyWith<$Res>
    implements $ShareInfoModelCopyWith<$Res> {
  factory _$$_ShareInfoModelCopyWith(
          _$_ShareInfoModel value, $Res Function(_$_ShareInfoModel) then) =
      __$$_ShareInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String companyName, String symbol, String ltp, String change});
}

/// @nodoc
class __$$_ShareInfoModelCopyWithImpl<$Res>
    extends _$ShareInfoModelCopyWithImpl<$Res, _$_ShareInfoModel>
    implements _$$_ShareInfoModelCopyWith<$Res> {
  __$$_ShareInfoModelCopyWithImpl(
      _$_ShareInfoModel _value, $Res Function(_$_ShareInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? symbol = null,
    Object? ltp = null,
    Object? change = null,
  }) {
    return _then(_$_ShareInfoModel(
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
class _$_ShareInfoModel implements _ShareInfoModel {
  const _$_ShareInfoModel(
      {required this.companyName,
      required this.symbol,
      required this.ltp,
      required this.change});

  factory _$_ShareInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShareInfoModelFromJson(json);

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
    return 'ShareInfoModel(companyName: $companyName, symbol: $symbol, ltp: $ltp, change: $change)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShareInfoModel &&
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
  _$$_ShareInfoModelCopyWith<_$_ShareInfoModel> get copyWith =>
      __$$_ShareInfoModelCopyWithImpl<_$_ShareInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareInfoModelToJson(
      this,
    );
  }
}

abstract class _ShareInfoModel implements ShareInfoModel {
  const factory _ShareInfoModel(
      {required final String companyName,
      required final String symbol,
      required final String ltp,
      required final String change}) = _$_ShareInfoModel;

  factory _ShareInfoModel.fromJson(Map<String, dynamic> json) =
      _$_ShareInfoModel.fromJson;

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
  _$$_ShareInfoModelCopyWith<_$_ShareInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
