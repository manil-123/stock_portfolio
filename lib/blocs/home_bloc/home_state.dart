import 'package:equatable/equatable.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_gainers_model.dart';
import 'package:share_portfolio/model/top_losers_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  final NepseIndexModel? nepseIndex;
  final List<TopGainersModel>? topGainers;
  final List<TopLosersModel>? topLosers;

  HomeStateLoaded({this.nepseIndex, this.topGainers, this.topLosers});
}

class HomeStateFailedToLoad extends HomeState {}
