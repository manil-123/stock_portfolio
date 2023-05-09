import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/blocs/watchlist/state/watchlist_state.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

@LazySingleton()
class AddToWatchlistCubit extends Cubit<WatchlistState> {
  final LocalStockRepository _localStockRepository;

  AddToWatchlistCubit(this._localStockRepository)
      : super(
          WatchlistState.initial(),
        );

  void addStockToWatchList(WatchlistDataModel watchlistDataModel) async {
    emit(
      WatchlistState.loading(),
    );
    try {
      final result =
          await _localStockRepository.addToWatchlist(watchlistDataModel);
      if (result != 0) {
        emit(
          WatchlistState.success(),
        );
      } else {
        emit(
          WatchlistState.failed(errorMessage: "Stock already in the watchlist"),
        );
      }
    } catch (e) {
      emit(
        WatchlistState.failed(errorMessage: "Failed to add stock in watchlist"),
      );
    }
  }
}
