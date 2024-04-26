// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_portfolio_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadPortfolioState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)
        loaded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadPortfolioStateCopyWith<$Res> {
  factory $LoadPortfolioStateCopyWith(
          LoadPortfolioState value, $Res Function(LoadPortfolioState) then) =
      _$LoadPortfolioStateCopyWithImpl<$Res, LoadPortfolioState>;
}

/// @nodoc
class _$LoadPortfolioStateCopyWithImpl<$Res, $Val extends LoadPortfolioState>
    implements $LoadPortfolioStateCopyWith<$Res> {
  _$LoadPortfolioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoadPortfolioStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoadPortfolioState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)
        loaded,
    required TResult Function() failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult? Function()? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult Function()? failed,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoadPortfolioState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoadPortfolioStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoadPortfolioState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)
        loaded,
    required TResult Function() failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult? Function()? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult Function()? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoadPortfolioState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double totalInvestment,
      int totalShares,
      int totalStock,
      double totalProfiLoss,
      double currentValue,
      double totalPLPercentage,
      double totalDailyPL,
      List<LocalStockDataModel> localStockDataList,
      List<PieChartDataModel> pieChartDataList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$LoadPortfolioStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalInvestment = null,
    Object? totalShares = null,
    Object? totalStock = null,
    Object? totalProfiLoss = null,
    Object? currentValue = null,
    Object? totalPLPercentage = null,
    Object? totalDailyPL = null,
    Object? localStockDataList = null,
    Object? pieChartDataList = null,
  }) {
    return _then(_$LoadedImpl(
      totalInvestment: null == totalInvestment
          ? _value.totalInvestment
          : totalInvestment // ignore: cast_nullable_to_non_nullable
              as double,
      totalShares: null == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as int,
      totalStock: null == totalStock
          ? _value.totalStock
          : totalStock // ignore: cast_nullable_to_non_nullable
              as int,
      totalProfiLoss: null == totalProfiLoss
          ? _value.totalProfiLoss
          : totalProfiLoss // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalPLPercentage: null == totalPLPercentage
          ? _value.totalPLPercentage
          : totalPLPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      totalDailyPL: null == totalDailyPL
          ? _value.totalDailyPL
          : totalDailyPL // ignore: cast_nullable_to_non_nullable
              as double,
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

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.totalInvestment,
      required this.totalShares,
      required this.totalStock,
      required this.totalProfiLoss,
      required this.currentValue,
      required this.totalPLPercentage,
      required this.totalDailyPL,
      required final List<LocalStockDataModel> localStockDataList,
      required final List<PieChartDataModel> pieChartDataList})
      : _localStockDataList = localStockDataList,
        _pieChartDataList = pieChartDataList;

  @override
  final double totalInvestment;
  @override
  final int totalShares;
  @override
  final int totalStock;
  @override
  final double totalProfiLoss;
  @override
  final double currentValue;
  @override
  final double totalPLPercentage;
  @override
  final double totalDailyPL;
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
    return 'LoadPortfolioState.loaded(totalInvestment: $totalInvestment, totalShares: $totalShares, totalStock: $totalStock, totalProfiLoss: $totalProfiLoss, currentValue: $currentValue, totalPLPercentage: $totalPLPercentage, totalDailyPL: $totalDailyPL, localStockDataList: $localStockDataList, pieChartDataList: $pieChartDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.totalInvestment, totalInvestment) ||
                other.totalInvestment == totalInvestment) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.totalStock, totalStock) ||
                other.totalStock == totalStock) &&
            (identical(other.totalProfiLoss, totalProfiLoss) ||
                other.totalProfiLoss == totalProfiLoss) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.totalPLPercentage, totalPLPercentage) ||
                other.totalPLPercentage == totalPLPercentage) &&
            (identical(other.totalDailyPL, totalDailyPL) ||
                other.totalDailyPL == totalDailyPL) &&
            const DeepCollectionEquality()
                .equals(other._localStockDataList, _localStockDataList) &&
            const DeepCollectionEquality()
                .equals(other._pieChartDataList, _pieChartDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalInvestment,
      totalShares,
      totalStock,
      totalProfiLoss,
      currentValue,
      totalPLPercentage,
      totalDailyPL,
      const DeepCollectionEquality().hash(_localStockDataList),
      const DeepCollectionEquality().hash(_pieChartDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)
        loaded,
    required TResult Function() failed,
  }) {
    return loaded(
        totalInvestment,
        totalShares,
        totalStock,
        totalProfiLoss,
        currentValue,
        totalPLPercentage,
        totalDailyPL,
        localStockDataList,
        pieChartDataList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult? Function()? failed,
  }) {
    return loaded?.call(
        totalInvestment,
        totalShares,
        totalStock,
        totalProfiLoss,
        currentValue,
        totalPLPercentage,
        totalDailyPL,
        localStockDataList,
        pieChartDataList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          totalInvestment,
          totalShares,
          totalStock,
          totalProfiLoss,
          currentValue,
          totalPLPercentage,
          totalDailyPL,
          localStockDataList,
          pieChartDataList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LoadPortfolioState {
  const factory _Loaded(
      {required final double totalInvestment,
      required final int totalShares,
      required final int totalStock,
      required final double totalProfiLoss,
      required final double currentValue,
      required final double totalPLPercentage,
      required final double totalDailyPL,
      required final List<LocalStockDataModel> localStockDataList,
      required final List<PieChartDataModel> pieChartDataList}) = _$LoadedImpl;

  double get totalInvestment;
  int get totalShares;
  int get totalStock;
  double get totalProfiLoss;
  double get currentValue;
  double get totalPLPercentage;
  double get totalDailyPL;
  List<LocalStockDataModel> get localStockDataList;
  List<PieChartDataModel> get pieChartDataList;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$LoadPortfolioStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl();

  @override
  String toString() {
    return 'LoadPortfolioState.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)
        loaded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            double totalInvestment,
            int totalShares,
            int totalStock,
            double totalProfiLoss,
            double currentValue,
            double totalPLPercentage,
            double totalDailyPL,
            List<LocalStockDataModel> localStockDataList,
            List<PieChartDataModel> pieChartDataList)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements LoadPortfolioState {
  const factory _Failed() = _$FailedImpl;
}
