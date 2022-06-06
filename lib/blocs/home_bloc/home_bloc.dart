import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_event.dart';
import 'package:share_portfolio/blocs/home_bloc/home_state.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/top_gainers_model.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  NepseRepo? nepseRepo = NepseRepo();

  HomeBloc({this.nepseRepo}) : super(HomeStateLoading()) {
    on<LoadHome>((event, emit) async {
      emit(HomeStateLoading());
      NepseIndexModel? nepseIndex = await nepseRepo!.getNepseIndex();
      List<TopGainersModel>? topGainers = await nepseRepo!.getTopGainers();
      List<TopLosersModel>? topLosers = await nepseRepo!.getTopLosers();
      emit(HomeStateLoaded(
          nepseIndex: nepseIndex,
          topGainers: topGainers,
          topLosers: topLosers));
    });
  }
}
