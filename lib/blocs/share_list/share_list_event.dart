part of 'share_list_bloc.dart';

@freezed
class ShareListEvent with _$ShareListEvent {
  const factory ShareListEvent.loadShareList() = _LoadShareList;
}
