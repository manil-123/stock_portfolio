part of 'load_portfolio_stock_list_cubit.dart';

@freezed
class LoadPortfolioStockListState with _$LoadPortfolioStockListState {
  const factory LoadPortfolioStockListState.initial() = _Initial;
  const factory LoadPortfolioStockListState.loading() = _Loading;
  const factory LoadPortfolioStockListState.loaded({
    required List<LocalStockDataModel> localStockDataList,
  }) = _Loaded;
  const factory LoadPortfolioStockListState.failed() = _Failed;
}
