import 'package:equatable/equatable.dart';
import '../../model/local_stock_data.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object> get props => [];
}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final double totalInvestment;
  final int totalShares;
  final int totalStock;
  final double totalProfiLoss;
  final double currentValue;
  final double totalPLPercentage;
  final double totalDailyPL;
  final List<LocalStockData> localStockDataList;

  PortfolioLoaded({
    required this.totalInvestment,
    required this.totalShares,
    required this.totalStock,
    required this.totalProfiLoss,
    required this.currentValue,
    required this.totalPLPercentage,
    required this.totalDailyPL,
    required this.localStockDataList,
  });

  @override
  List<Object> get props => [
        totalInvestment,
        totalShares,
        totalStock,
        totalProfiLoss,
        currentValue,
        totalPLPercentage,
        totalDailyPL,
        localStockDataList,
      ];
}

class PortfolioFailedToLoad extends PortfolioState {}
