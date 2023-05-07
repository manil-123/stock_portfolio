part of 'delete_from_watchlist_cubit.dart';

@freezed
class DeleteFromWatchlistState with _$DeleteFromWatchlistState {
  const factory DeleteFromWatchlistState.initial() = _Initial;
  const factory DeleteFromWatchlistState.loading() = _Loading;
  const factory DeleteFromWatchlistState.success() = _Success;
  const factory DeleteFromWatchlistState.failed(
      {required String errorMessage}) = _Failed;
}
