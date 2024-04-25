import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'load_watchlist_state.dart';
part 'load_watchlist_cubit.freezed.dart';

@injectable
class LoadWatchlistCubit extends Cubit<LoadWatchlistState> {
  final LocalStockRepository _localStockRepository;
  LoadWatchlistCubit(this._localStockRepository)
      : super(
          const LoadWatchlistState.initial(),
        );

  void loadWatchlist() async {
    emit(
      const LoadWatchlistState.loading(),
    );
    try {
      final watchlist = await _localStockRepository.getStockWatchlist();
      emit(
        LoadWatchlistState.loaded(watchlistDataList: watchlist),
      );
    } catch (e) {
      emit(
        const LoadWatchlistState.failed(
            errorMessage: "Failed to load watchlist"),
      );
    }
  }
}
