import 'package:equatable/equatable.dart';
import '../../model/local_stock_data.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object> get props => [];
}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<LocalStockData>? localStockDataList;

  PortfolioLoaded({this.localStockDataList});
}

class PortfolioFailedToLoad extends PortfolioState {}
