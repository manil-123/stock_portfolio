import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'load_portfolio_stock_list_state.dart';
part 'load_portfolio_stock_list_cubit.freezed.dart';

@LazySingleton()
class LoadPortfolioStockListCubit extends Cubit<LoadPortfolioStockListState> {
  final LocalStockRepository _localStockRepository;

  LoadPortfolioStockListCubit(
    this._localStockRepository,
  ) : super(
          LoadPortfolioStockListState.initial(),
        );

  void loadStocksList() async {
    emit(
      LoadPortfolioStockListState.loading(),
    );
    try {
      await Future.delayed(
        Duration(milliseconds: 500),
      );
      final localStockList = await _localStockRepository.getLocalStockList();

      emit(
        LoadPortfolioStockListState.loaded(localStockDataList: localStockList),
      );
    } catch (e) {
      emit(
        LoadPortfolioStockListState.failed(),
      );
    }
  }
}
