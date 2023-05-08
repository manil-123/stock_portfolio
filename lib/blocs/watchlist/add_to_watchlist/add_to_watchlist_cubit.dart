import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'add_to_watchlist_state.dart';
part 'add_to_watchlist_cubit.freezed.dart';

@LazySingleton()
class AddToWatchlistCubit extends Cubit<AddToWatchlistState> {
  final LocalStockRepository _localStockRepository;

  AddToWatchlistCubit(this._localStockRepository)
      : super(
          AddToWatchlistState.initial(),
        );

  void addStockToWatchList(WatchlistDataModel watchlistDataModel) async {
    emit(
      AddToWatchlistState.loading(),
    );
    try {
      final result =
          await _localStockRepository.addToWatchlist(watchlistDataModel);
      if (result != 0) {
        emit(
          AddToWatchlistState.success(),
        );
      } else {
        emit(
          AddToWatchlistState.failed(
              errorMessage: "Stock already in the watchlist"),
        );
      }
    } catch (e) {
      emit(
        AddToWatchlistState.failed(
            errorMessage: "Failed to add stock in watchlist"),
      );
    }
  }
}
