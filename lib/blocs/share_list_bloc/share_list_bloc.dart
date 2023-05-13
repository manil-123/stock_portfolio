import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/share_info_dao.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';

part 'share_list_event.dart';
part 'share_list_state.dart';
part 'share_list_bloc.freezed.dart';

@LazySingleton()
class ShareListBloc extends Bloc<ShareListEvent, ShareListState> {
  final ShareInfoListDAO shareInfoListDAO;
  final NepseRepository nepseRepo;
  ShareListBloc(
    this.shareInfoListDAO,
    this.nepseRepo,
  ) : super(
          ShareListState.initial(),
        ) {
    on<_LoadShareList>((event, emit) async {
      emit(
        ShareListState.loading(),
      );
      List<ShareInfoModel> shareList = await nepseRepo.getShareInfoList();
      shareInfoListDAO.insert(
        ShareInfoList(shareInfoList: shareList),
      );
      emit(
        ShareListState.loaded(shareList: shareList),
      );
    });
  }
}
