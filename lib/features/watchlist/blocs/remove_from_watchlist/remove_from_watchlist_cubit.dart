import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'remove_from_watchlist_state.dart';
part 'remove_from_watchlist_cubit.freezed.dart';

@injectable
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
      await _localStockRepository.removeFromWatchlist(watchlistDataModel);
      emit(
        const RemoveFromWatchlistState.success(),
      );
    } catch (e) {
      emit(
        const RemoveFromWatchlistState.failed(
            errorMessage: AppStrings.watchlistFailedToDelete),
      );
    }
  }
}
