// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_portfolio_stock_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadPortfolioStockListState {
  List<LocalStockDataModel> get localStockDataList =>
      throw _privateConstructorUsedError;
  List<PieChartDataModel> get pieChartDataList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadPortfolioStockListStateCopyWith<LoadPortfolioStockListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadPortfolioStockListStateCopyWith<$Res> {
  factory $LoadPortfolioStockListStateCopyWith(
          LoadPortfolioStockListState value,
          $Res Function(LoadPortfolioStockListState) then) =
      _$LoadPortfolioStockListStateCopyWithImpl<$Res,
          LoadPortfolioStockListState>;
  @useResult
  $Res call(
      {List<LocalStockDataModel> localStockDataList,
      List<PieChartDataModel> pieChartDataList});
}

/// @nodoc
class _$LoadPortfolioStockListStateCopyWithImpl<$Res,
        $Val extends LoadPortfolioStockListState>
    implements $LoadPortfolioStockListStateCopyWith<$Res> {
  _$LoadPortfolioStockListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localStockDataList = null,
    Object? pieChartDataList = null,
  }) {
    return _then(_value.copyWith(
      localStockDataList: null == localStockDataList
          ? _value.localStockDataList
          : localStockDataList // ignore: cast_nullable_to_non_nullable
              as List<LocalStockDataModel>,
      pieChartDataList: null == pieChartDataList
          ? _value.pieChartDataList
          : pieChartDataList // ignore: cast_nullable_to_non_nullable
              as List<PieChartDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadPortfolioStockListStateImplCopyWith<$Res>
    implements $LoadPortfolioStockListStateCopyWith<$Res> {
  factory _$$LoadPortfolioStockListStateImplCopyWith(
          _$LoadPortfolioStockListStateImpl value,
          $Res Function(_$LoadPortfolioStockListStateImpl) then) =
      __$$LoadPortfolioStockListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LocalStockDataModel> localStockDataList,
      List<PieChartDataModel> pieChartDataList});
}

/// @nodoc
class __$$LoadPortfolioStockListStateImplCopyWithImpl<$Res>
    extends _$LoadPortfolioStockListStateCopyWithImpl<$Res,
        _$LoadPortfolioStockListStateImpl>
    implements _$$LoadPortfolioStockListStateImplCopyWith<$Res> {
  __$$LoadPortfolioStockListStateImplCopyWithImpl(
      _$LoadPortfolioStockListStateImpl _value,
      $Res Function(_$LoadPortfolioStockListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localStockDataList = null,
    Object? pieChartDataList = null,
  }) {
    return _then(_$LoadPortfolioStockListStateImpl(
      localStockDataList: null == localStockDataList
          ? _value._localStockDataList
          : localStockDataList // ignore: cast_nullable_to_non_nullable
              as List<LocalStockDataModel>,
      pieChartDataList: null == pieChartDataList
          ? _value._pieChartDataList
          : pieChartDataList // ignore: cast_nullable_to_non_nullable
              as List<PieChartDataModel>,
    ));
  }
}

/// @nodoc

class _$LoadPortfolioStockListStateImpl
    implements _LoadPortfolioStockListState {
  const _$LoadPortfolioStockListStateImpl(
      {required final List<LocalStockDataModel> localStockDataList,
      required final List<PieChartDataModel> pieChartDataList})
      : _localStockDataList = localStockDataList,
        _pieChartDataList = pieChartDataList;

  final List<LocalStockDataModel> _localStockDataList;
  @override
  List<LocalStockDataModel> get localStockDataList {
    if (_localStockDataList is EqualUnmodifiableListView)
      return _localStockDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localStockDataList);
  }

  final List<PieChartDataModel> _pieChartDataList;
  @override
  List<PieChartDataModel> get pieChartDataList {
    if (_pieChartDataList is EqualUnmodifiableListView)
      return _pieChartDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pieChartDataList);
  }

  @override
  String toString() {
    return 'LoadPortfolioStockListState(localStockDataList: $localStockDataList, pieChartDataList: $pieChartDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPortfolioStockListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._localStockDataList, _localStockDataList) &&
            const DeepCollectionEquality()
                .equals(other._pieChartDataList, _pieChartDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_localStockDataList),
      const DeepCollectionEquality().hash(_pieChartDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPortfolioStockListStateImplCopyWith<_$LoadPortfolioStockListStateImpl>
      get copyWith => __$$LoadPortfolioStockListStateImplCopyWithImpl<
          _$LoadPortfolioStockListStateImpl>(this, _$identity);
}

abstract class _LoadPortfolioStockListState
    implements LoadPortfolioStockListState {
  const factory _LoadPortfolioStockListState(
          {required final List<LocalStockDataModel> localStockDataList,
          required final List<PieChartDataModel> pieChartDataList}) =
      _$LoadPortfolioStockListStateImpl;

  @override
  List<LocalStockDataModel> get localStockDataList;
  @override
  List<PieChartDataModel> get pieChartDataList;
  @override
  @JsonKey(ignore: true)
  _$$LoadPortfolioStockListStateImplCopyWith<_$LoadPortfolioStockListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
