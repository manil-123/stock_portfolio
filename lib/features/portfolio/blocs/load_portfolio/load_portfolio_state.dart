part of 'load_portfolio_cubit.dart';

@freezed
class LoadPortfolioState with _$LoadPortfolioState {
  const factory LoadPortfolioState.initial() = _Initial;
  const factory LoadPortfolioState.loading() = _Loading;
  const factory LoadPortfolioState.loaded({
    required double totalInvestment,
    required int totalShares,
    required int totalStock,
    required double totalProfiLoss,
    required double currentValue,
    required double totalPLPercentage,
    required double totalDailyPL,
    required List<LocalStockDataModel> localStockDataList,
  }) = _Loaded;
  const factory LoadPortfolioState.failed() = _Failed;
}
