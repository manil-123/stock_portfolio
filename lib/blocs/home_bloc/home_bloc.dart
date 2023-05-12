import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@LazySingleton()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NepseRepository nepseRepo;

  HomeBloc(this.nepseRepo)
      : super(
          HomeState.initial(),
        ) {
    on<_LoadHome>((event, emit) async {
      emit(
        HomeState.loading(),
      );
      NepseIndexModel nepseIndex = await nepseRepo.getNepseIndex();
      final topGainersListResponse = await nepseRepo.getTopGainers();
      final topLosersListResponse = await nepseRepo.getTopLosers();
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
