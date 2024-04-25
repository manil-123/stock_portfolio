part of 'remove_from_watchlist_cubit.dart';

@freezed
class RemoveFromWatchlistState with _$RemoveFromWatchlistState {
  const factory RemoveFromWatchlistState.initial() = _Initial;
  const factory RemoveFromWatchlistState.loading() = _Loading;
  const factory RemoveFromWatchlistState.success() = _Success;
  const factory RemoveFromWatchlistState.failed(
      {required String errorMessage}) = _Failed;
}
