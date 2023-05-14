import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_event.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_state.dart';
import 'package:share_portfolio/app/database/share_info_dao.dart';
import 'package:share_portfolio/model/share_info_list.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';

@LazySingleton()
class ShareListBloc extends Bloc<ShareListEvent, ShareListState> {
  final ShareInfoListDAO shareInfoListDAO;
  final NepseRepositoryImpl nepseRepo;

  ShareListBloc(this.shareInfoListDAO, this.nepseRepo)
      : super(ShareListLoading()) {
    on<LoadShareList>((event, emit) async {
      emit(ShareListLoading());
      List<ShareInfoModel> shareList = await nepseRepo!.getShareInfoList();
      shareInfoListDAO!.insert(ShareInfoList(shareInfoList: shareList));
      emit(ShareListLoaded(shareList: shareList));
    });
  }
}
