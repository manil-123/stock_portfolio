import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';

part 'load_portfolio_state.dart';
part 'load_portfolio_cubit.freezed.dart';

@LazySingleton()
class LoadPortfolioCubit extends Cubit<LoadPortfolioState> {
  final LocalStockListDAO localStockListDAO;
  final CalculationRepository calculationRepo;
  LoadPortfolioCubit(
    this.localStockListDAO,
    this.calculationRepo,
  ) : super(
          LoadPortfolioState.initial(),
        );

  void loadPortfolio() async {
    emit(
      LoadPortfolioState.loading(),
    );
    try {
      final localStockList = await localStockListDAO.getLocalStockList() ?? [];
      final totalInvestment = await calculationRepo.getTotalInvestment();
      final totalShares = await calculationRepo.getTotalSharesCount();
      final totalStock = await calculationRepo.getTotalStockCount();
      final totalProfitLoss = await calculationRepo.getTotalProfitLoss();
      final currentValue = await calculationRepo.getCurrentValue();
      final totalPLPercentage = await calculationRepo.profitLossPercentage();
      final dailyPL = await calculationRepo.getTotalDailyProfitLoss();
      emit(
        LoadPortfolioState.loaded(
            totalInvestment: totalInvestment,
            totalShares: totalShares,
            totalStock: totalStock,
            totalProfiLoss: totalProfitLoss,
            currentValue: currentValue,
            totalPLPercentage: totalPLPercentage,
            totalDailyPL: dailyPL,
            localStockDataList: localStockList),
      );
    } catch (e) {
      emit(
        LoadPortfolioState.failed(),
      );
    }
  }
}
