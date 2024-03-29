part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required NepseIndexModel nepseIndex,
    required List<NepseTimeSeriesData> nepseTimeSeriesData,
    required List<TopGainersModel> topGainers,
    required List<TopLosersModel> topLosers,
  }) = _Loaded;
  const factory HomeState.failed({required Failure failure}) = _Failed;
}
