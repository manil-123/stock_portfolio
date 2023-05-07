import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'delete_from_watchlist_state.dart';
part 'delete_from_watchlist_cubit.freezed.dart';

class DeleteFromWatchlistCubit extends Cubit<DeleteFromWatchlistState> {
  final LocalStockRepository _localStockRepository;

  DeleteFromWatchlistCubit(this._localStockRepository)
      : super(
          const DeleteFromWatchlistState.initial(),
        );

  void removeStockFromWatchList(WatchlistDataModel watchlistDataModel) async {
    emit(
      const DeleteFromWatchlistState.loading(),
    );
    try {
      final result =
          await _localStockRepository.removeFromWatchlist(watchlistDataModel);
      if (result != 0) {
        emit(
          const DeleteFromWatchlistState.success(),
        );
      } else {
        emit(
          const DeleteFromWatchlistState.failed(
              errorMessage: "Failed to delete stock from watchlist"),
        );
      }
    } catch (e) {
      emit(
        const DeleteFromWatchlistState.failed(
            errorMessage: "Failed to delete stock from watchlist"),
      );
    }
  }
}
