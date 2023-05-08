import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/blocs/watchlist/state/watchlist_state.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

@LazySingleton()
class LoadWatchlistCubit extends Cubit<WatchlistState> {
  final LocalStockRepository _localStockRepository;

  LoadWatchlistCubit(this._localStockRepository)
      : super(
          WatchlistState.initial(),
        );

  void loadWatchList() async {
    emit(
      WatchlistState.loading(),
    );
    try {
      final watchlist = await _localStockRepository.getStockWatchlist();
      emit(
        WatchlistState.loaded(watchlistDataList: watchlist),
      );
    } catch (e) {
      emit(
        WatchlistState.failed(errorMessage: "Failed to load watchlist"),
      );
    }
  }
}
