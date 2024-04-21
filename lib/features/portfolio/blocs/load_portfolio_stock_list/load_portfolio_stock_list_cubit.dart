import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'load_portfolio_stock_list_state.dart';
part 'load_portfolio_stock_list_cubit.freezed.dart';

@Injectable()
class LoadPortfolioStockListCubit extends Cubit<LoadPortfolioStockListState> {
  final LocalStockRepository _localStockRepository;

  LoadPortfolioStockListCubit(
    this._localStockRepository,
  ) : super(
          const LoadPortfolioStockListState.initial(),
        );

  void loadStocksList() async {
    emit(
      const LoadPortfolioStockListState.loading(),
    );
    try {
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
      final localStockList = await _localStockRepository.getLocalStockList();

      emit(
        LoadPortfolioStockListState.loaded(localStockDataList: localStockList),
      );
    } catch (e) {
      emit(
        const LoadPortfolioStockListState.failed(),
      );
    }
  }
}
