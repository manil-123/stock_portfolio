import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'remove_from_watchlist_state.dart';
part 'remove_from_watchlist_cubit.freezed.dart';

@LazySingleton()
class RemoveFromWatchlistCubit extends Cubit<RemoveFromWatchlistState> {
  final LocalStockRepository _localStockRepository;

  RemoveFromWatchlistCubit(this._localStockRepository)
      : super(
          const RemoveFromWatchlistState.initial(),
        );

  void removeStockFromWatchList(WatchlistDataModel watchlistDataModel) async {
    emit(
      const RemoveFromWatchlistState.loading(),
    );
    try {
      final result =
          await _localStockRepository.removeFromWatchlist(watchlistDataModel);
      if (result != 0) {
        emit(
          const RemoveFromWatchlistState.success(),
        );
      } else {
        emit(
          const RemoveFromWatchlistState.failed(
              errorMessage: "Failed to delete stock from watchlist"),
        );
      }
    } catch (e) {
      emit(
        const RemoveFromWatchlistState.failed(
            errorMessage: "Failed to delete stock from watchlist"),
      );
    }
  }
}
