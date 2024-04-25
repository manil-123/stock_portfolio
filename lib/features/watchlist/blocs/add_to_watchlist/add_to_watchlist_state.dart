part of 'add_to_watchlist_cubit.dart';

@freezed
class AddToWatchlistState with _$AddToWatchlistState {
  const factory AddToWatchlistState.initial() = _Initial;
  const factory AddToWatchlistState.loading() = _Loading;
  const factory AddToWatchlistState.success() = _Success;
  const factory AddToWatchlistState.failed({required String errorMessage}) =
      _Failed;
}
