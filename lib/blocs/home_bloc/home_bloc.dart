import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/blocs/home_bloc/home_event.dart';
import 'package:share_portfolio/blocs/home_bloc/home_state.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_gainers_model.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';

@LazySingleton()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NepseRepository nepseRepo;

  HomeBloc(this.nepseRepo)
      : super(
          HomeStateLoading(),
        ) {
    on<LoadHome>((event, emit) async {
      emit(HomeStateLoading());
      NepseIndexModel? nepseIndex = await nepseRepo.getNepseIndex();
      List<TopGainersModel>? topGainers = await nepseRepo.getTopGainers();
      List<TopLosersModel>? topLosers = await nepseRepo.getTopLosers();
      emit(
        HomeStateLoaded(
            nepseIndex: nepseIndex,
            topGainers: topGainers,
            topLosers: topLosers),
      );
    });
  }
}
