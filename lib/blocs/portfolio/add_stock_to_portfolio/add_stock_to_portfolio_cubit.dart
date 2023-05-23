import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';

part 'add_stock_to_portfolio_state.dart';
part 'add_stock_to_portfolio_cubit.freezed.dart';

@LazySingleton()
class AddStockToPortfolioCubit extends Cubit<AddStockToPortfolioState> {
  final LocalStockListDAO localStockListDAO;
  final CalculationRepository calculationRepo;
  AddStockToPortfolioCubit(
    this.localStockListDAO,
    this.calculationRepo,
  ) : super(
          AddStockToPortfolioState.initial(),
        );

  void addStockToPortfolio(LocalStockData localStockData) async {
    emit(
      AddStockToPortfolioState.loading(),
    );
    try {
      await localStockListDAO.insert(localStockData);

      emit(
        AddStockToPortfolioState.success(),
      );
    } catch (e) {
      emit(
        AddStockToPortfolioState.failed(),
      );
    }
  }
}
