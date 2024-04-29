part of 'load_portfolio_stock_list_cubit.dart';

@freezed
class LoadPortfolioStockListState with _$LoadPortfolioStockListState {
  const factory LoadPortfolioStockListState(
          {required List<LocalStockDataModel> localStockDataList,
          required List<PieChartDataModel> pieChartDataList}) =
      _LoadPortfolioStockListState;
}
