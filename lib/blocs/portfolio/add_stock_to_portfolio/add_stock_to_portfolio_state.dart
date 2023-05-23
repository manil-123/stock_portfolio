part of 'add_stock_to_portfolio_cubit.dart';

@freezed
class AddStockToPortfolioState with _$AddStockToPortfolioState {
  const factory AddStockToPortfolioState.initial() = _Initial;
  const factory AddStockToPortfolioState.loading() = _Loading;
  const factory AddStockToPortfolioState.success() = _Success;
  const factory AddStockToPortfolioState.failed() = _Failed;
}
