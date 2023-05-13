part of 'share_list_bloc.dart';

abstract class ShareListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadShareList extends ShareListEvent {}
