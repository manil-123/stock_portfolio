import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/model/home/nepse_price_series/nepse_time_series_data_response.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/repository/nepse_repository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@LazySingleton()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NepseRepository _nepseRepo;

  HomeBloc(this._nepseRepo)
      : super(
          const HomeState.initial(),
        ) {
    on<_LoadHome>((event, emit) async {
      emit(
        const HomeState.loading(),
      );
      NepseIndexModel nepseIndex = await _nepseRepo.getNepseIndex();
      final timeSeriesData = await _nepseRepo.getNepseTimeSeriesData();
      final topGainersListResponse = await _nepseRepo.getTopGainers();
      final topLosersListResponse = await _nepseRepo.getTopLosers();
      topGainersListResponse.fold(
        (failure) {
          emit(
            HomeState.failed(failure: failure),
          );
        },
        (topGainersList) {
          topLosersListResponse.fold((failure) {
            emit(
              HomeState.failed(failure: failure),
            );
          }, (topLosersList) {
            emit(
              HomeState.loaded(
                nepseIndex: nepseIndex,
                nepseTimeSeriesData: timeSeriesData.fold(
                  (l) => [],
                  (timeSeriesDataList) => timeSeriesDataList.reversed.toList(),
                ),
                topGainers: topGainersList,
                topLosers: topLosersList,
              ),
            );
          });
        },
      );
    });
  }
}
