import 'package:equatable/equatable.dart';
import '../../model/local_stock_data.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object> get props => [];
}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final double? totalInvestment;
  final int? totalShares;
  final int? totalStock;
  final double? totalProfiLoss;
  final double? currentValue;
  final double? totalPLPercentage;
  final List<LocalStockData>? localStockDataList;

  PortfolioLoaded(
      {this.totalInvestment,
      this.totalShares,
      this.totalStock,
      this.totalProfiLoss,
      this.currentValue,
      this.totalPLPercentage,
      this.localStockDataList});
}

class PortfolioFailedToLoad extends PortfolioState {}
