// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nepse_time_series_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NepseTimeSeriesData _$NepseTimeSeriesDataFromJson(Map<String, dynamic> json) {
  return _NepseTimeSeriesData.fromJson(json);
}

/// @nodoc
mixin _$NepseTimeSeriesData {
  String? get date => throw _privateConstructorUsedError;
  double? get index => throw _privateConstructorUsedError;
  double? get pointChange => throw _privateConstructorUsedError;
  double? get percentageChange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NepseTimeSeriesDataCopyWith<NepseTimeSeriesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NepseTimeSeriesDataCopyWith<$Res> {
  factory $NepseTimeSeriesDataCopyWith(
          NepseTimeSeriesData value, $Res Function(NepseTimeSeriesData) then) =
      _$NepseTimeSeriesDataCopyWithImpl<$Res, NepseTimeSeriesData>;
  @useResult
  $Res call(
      {String? date,
      double? index,
      double? pointChange,
      double? percentageChange});
}

/// @nodoc
class _$NepseTimeSeriesDataCopyWithImpl<$Res, $Val extends NepseTimeSeriesData>
    implements $NepseTimeSeriesDataCopyWith<$Res> {
  _$NepseTimeSeriesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? index = freezed,
    Object? pointChange = freezed,
    Object? percentageChange = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as double?,
      pointChange: freezed == pointChange
          ? _value.pointChange
          : pointChange // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageChange: freezed == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NepseTimeSeriesDataImplCopyWith<$Res>
    implements $NepseTimeSeriesDataCopyWith<$Res> {
  factory _$$NepseTimeSeriesDataImplCopyWith(_$NepseTimeSeriesDataImpl value,
          $Res Function(_$NepseTimeSeriesDataImpl) then) =
      __$$NepseTimeSeriesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      double? index,
      double? pointChange,
      double? percentageChange});
}

/// @nodoc
class __$$NepseTimeSeriesDataImplCopyWithImpl<$Res>
    extends _$NepseTimeSeriesDataCopyWithImpl<$Res, _$NepseTimeSeriesDataImpl>
    implements _$$NepseTimeSeriesDataImplCopyWith<$Res> {
  __$$NepseTimeSeriesDataImplCopyWithImpl(_$NepseTimeSeriesDataImpl _value,
      $Res Function(_$NepseTimeSeriesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? index = freezed,
    Object? pointChange = freezed,
    Object? percentageChange = freezed,
  }) {
    return _then(_$NepseTimeSeriesDataImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as double?,
      pointChange: freezed == pointChange
          ? _value.pointChange
          : pointChange // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageChange: freezed == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NepseTimeSeriesDataImpl implements _NepseTimeSeriesData {
  const _$NepseTimeSeriesDataImpl(
      {required this.date,
      required this.index,
      required this.pointChange,
      required this.percentageChange});

  factory _$NepseTimeSeriesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NepseTimeSeriesDataImplFromJson(json);

  @override
  final String? date;
  @override
  final double? index;
  @override
  final double? pointChange;
  @override
  final double? percentageChange;

  @override
  String toString() {
    return 'NepseTimeSeriesData(date: $date, index: $index, pointChange: $pointChange, percentageChange: $percentageChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NepseTimeSeriesDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.pointChange, pointChange) ||
                other.pointChange == pointChange) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, index, pointChange, percentageChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NepseTimeSeriesDataImplCopyWith<_$NepseTimeSeriesDataImpl> get copyWith =>
      __$$NepseTimeSeriesDataImplCopyWithImpl<_$NepseTimeSeriesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NepseTimeSeriesDataImplToJson(
      this,
    );
  }
}

abstract class _NepseTimeSeriesData implements NepseTimeSeriesData {
  const factory _NepseTimeSeriesData(
      {required final String? date,
      required final double? index,
      required final double? pointChange,
      required final double? percentageChange}) = _$NepseTimeSeriesDataImpl;

  factory _NepseTimeSeriesData.fromJson(Map<String, dynamic> json) =
      _$NepseTimeSeriesDataImpl.fromJson;

  @override
  String? get date;
  @override
  double? get index;
  @override
  double? get pointChange;
  @override
  double? get percentageChange;
  @override
  @JsonKey(ignore: true)
  _$$NepseTimeSeriesDataImplCopyWith<_$NepseTimeSeriesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
