part of 'share_list_bloc.dart';

@freezed
class ShareListState with _$ShareListState {
  const factory ShareListState.initial() = _Initial;
  const factory ShareListState.loading() = _Loading;
  const factory ShareListState.loaded(
      {required List<ShareInfoModel> shareList}) = _Loaded;
  const factory ShareListState.failed({required Failure failure}) = _Failed;
}
