import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_state.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final LocalStockListDAO? localStockListDAO;
  final CalculationRepo? calculationRepo;

  PortfolioBloc({this.localStockListDAO, this.calculationRepo})
      : super(PortfolioLoading()) {
    on<LoadPortfolio>((event, emit) async {
      emit(PortfolioLoading());
      try {
        final localStockList = await localStockListDAO!.getLocalStockList();
        final totalInvestment = await calculationRepo!.getTotalInvestment();
        final totalShares = await calculationRepo!.getTotalSharesCount();
        final totalStock = await calculationRepo!.getTotalStockCount();
        final totalProfitLoss = await calculationRepo!.getTotalProfitLoss();
        final currentValue = await calculationRepo!.getCurrentValue();
        final totalPLPercentage = await calculationRepo!.profitLossPercentage();
        final dailyPL = await calculationRepo!.getTotalDailyProfitLoss();
        emit(PortfolioLoaded(
            totalInvestment: totalInvestment,
            totalShares: totalShares,
            totalStock: totalStock,
            totalProfiLoss: totalProfitLoss,
            currentValue: currentValue,
            totalPLPercentage: totalPLPercentage,
            totalDailyPL: dailyPL,
            localStockDataList: localStockList));
      } catch (e) {
        emit(PortfolioFailedToLoad());
      }
    });
    on<AddStock>((event, emit) async {
      emit(PortfolioLoading());
      try {
        await localStockListDAO!.insert(event.localStockData!);
        final totalInvestment = await calculationRepo!.getTotalInvestment();
        final localStockList = await localStockListDAO!.getLocalStockList();
        final totalShares = await calculationRepo!.getTotalSharesCount();
        final totalStock = await calculationRepo!.getTotalStockCount();
        final totalProfitLoss = await calculationRepo!.getTotalProfitLoss();
        final currentValue = await calculationRepo!.getCurrentValue();
        final totalPLPercentage = await calculationRepo!.profitLossPercentage();
        final dailyPL = await calculationRepo!.getTotalDailyProfitLoss();
        emit(PortfolioLoaded(
            totalInvestment: totalInvestment,
            totalShares: totalShares,
            totalStock: totalStock,
            totalProfiLoss: totalProfitLoss,
            currentValue: currentValue,
            totalPLPercentage: totalPLPercentage,
            totalDailyPL: dailyPL,
            localStockDataList: localStockList));
      } catch (e) {
        emit(PortfolioFailedToLoad());
      }
    });

    on<DeleteStock>((event, emit) async {
      emit(PortfolioLoading());
      try {
        await localStockListDAO!.delete(event.localStockData!);
        final totalInvestment = await calculationRepo!.getTotalInvestment();
        final localStockList = await localStockListDAO!.getLocalStockList();
        final totalShares = await calculationRepo!.getTotalSharesCount();
        final totalStock = await calculationRepo!.getTotalStockCount();
        final totalProfitLoss = await calculationRepo!.getTotalProfitLoss();
        final currentValue = await calculationRepo!.getCurrentValue();
        final totalPLPercentage = await calculationRepo!.profitLossPercentage();
        final dailyPL = await calculationRepo!.getTotalDailyProfitLoss();
        emit(PortfolioLoaded(
            totalInvestment: totalInvestment,
            totalShares: totalShares,
            totalStock: totalStock,
            totalProfiLoss: totalProfitLoss,
            currentValue: currentValue,
            totalPLPercentage: totalPLPercentage,
            totalDailyPL: dailyPL,
            localStockDataList: localStockList));
      } catch (e) {
        emit(PortfolioFailedToLoad());
      }
    });
  }
}
