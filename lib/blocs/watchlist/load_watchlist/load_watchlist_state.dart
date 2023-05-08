part of 'load_watchlist_cubit.dart';

@freezed
class LoadWatchlistState with _$LoadWatchlistState {
  const factory LoadWatchlistState.initial() = _Initial;
  const factory LoadWatchlistState.loading() = _Loading;
  const factory LoadWatchlistState.loaded(
      {required List<WatchlistDataModel> watchlistDataList}) = _Loaded;
  const factory LoadWatchlistState.failed({required String errorMessage}) =
      _Failed;
}
