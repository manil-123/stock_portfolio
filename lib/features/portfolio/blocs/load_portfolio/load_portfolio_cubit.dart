import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'load_portfolio_state.dart';
part 'load_portfolio_cubit.freezed.dart';

@Injectable()
class LoadPortfolioCubit extends Cubit<LoadPortfolioState> {
  final LocalStockRepository _localStockRepository;
  final CalculationRepository _calculationRepo;
  LoadPortfolioCubit(
    this._localStockRepository,
    this._calculationRepo,
  ) : super(
          const LoadPortfolioState.initial(),
        );

  void loadPortfolio() async {
    emit(
      const LoadPortfolioState.loading(),
    );
    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
      final localStockList = await _localStockRepository.getLocalStockList();
      final totalInvestment = await _calculationRepo.getTotalInvestment();
      final totalShares = await _calculationRepo.getTotalSharesCount();
      final totalStock = await _calculationRepo.getTotalStockCount();
      final totalProfitLoss = await _calculationRepo.getTotalProfitLoss();
      final currentValue = await _calculationRepo.getCurrentValue();
      final totalPLPercentage = await _calculationRepo.profitLossPercentage();
      final dailyPL = await _calculationRepo.getTotalDailyProfitLoss();
      emit(
        LoadPortfolioState.loaded(
          totalInvestment: totalInvestment,
          totalShares: totalShares,
          totalStock: totalStock,
          totalProfiLoss: totalProfitLoss,
          currentValue: currentValue,
          totalPLPercentage: totalPLPercentage,
          totalDailyPL: dailyPL,
          localStockDataList: localStockList,
        ),
      );
    } catch (e) {
      emit(
        const LoadPortfolioState.failed(),
      );
    }
  }

  Future<String> getCompanyPrice(String? scrip) async {
    var ltp = await _calculationRepo.getLTP(scrip);
    return ltp;
  }

  Future<double> getLTPDiff(String? scrip) async {
    var value = await _calculationRepo.getLTPDifference(scrip);
    return value;
  }
}
