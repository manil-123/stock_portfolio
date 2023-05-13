part of 'share_list_bloc.dart';

abstract class ShareListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShareListLoading extends ShareListState {}

class ShareListLoaded extends ShareListState {
  final List<ShareInfoModel> shareList;

  ShareListLoaded({required this.shareList});
}

class ShareListFailedToLoad extends ShareListState {}
