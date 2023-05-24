import 'package:equatable/equatable.dart';
import 'package:share_portfolio/model/local_stock_data.dart';

abstract class PortfolioEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPortfolio extends PortfolioEvent {}
