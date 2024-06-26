import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'add_to_watchlist_state.dart';
part 'add_to_watchlist_cubit.freezed.dart';

@LazySingleton()
class AddToWatchlistCubit extends Cubit<AddToWatchlistState> {
  final LocalStockRepository _localStockRepository;

  AddToWatchlistCubit(this._localStockRepository)
      : super(
          const AddToWatchlistState.initial(),
        );

  void addStockToWatchList(WatchlistDataModel watchlistDataModel) async {
    emit(
      const AddToWatchlistState.loading(),
    );
    try {
      final result =
          await _localStockRepository.addToWatchlist(watchlistDataModel);
      if (result != 0) {
        emit(
          const AddToWatchlistState.success(),
        );
      } else {
        emit(
          const AddToWatchlistState.failed(
              errorMessage: AppStrings.stockAlreadyInWatchlist),
        );
      }
    } catch (e) {
      emit(
        const AddToWatchlistState.failed(
            errorMessage: AppStrings.watchlistFailedToAdd),
      );
    }
  }
}
