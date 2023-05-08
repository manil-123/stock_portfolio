import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';
import 'package:share_portfolio/repository/nepse_repository.dart';

part 'share_list_event.dart';
part 'share_list_state.dart';
part 'share_list_bloc.freezed.dart';

@LazySingleton()
class ShareListBloc extends Bloc<ShareListEvent, ShareListState> {
  final LocalStockRepository _localStockRepository;
  final NepseRepository _nepseRepo;
  ShareListBloc(
    this._localStockRepository,
    this._nepseRepo,
  ) : super(
          const ShareListState.initial(),
        ) {
    on<_LoadShareList>((event, emit) async {
      emit(
        const ShareListState.loading(),
      );
      final shareListResponse = await _nepseRepo.getShareInfoList();
      shareListResponse.fold((failure) {
        emit(
          ShareListState.failed(failure: failure),
        );
      }, (shareList) {
        _localStockRepository.insertShareInfoList(shareInfoList: shareList);
        emit(
          ShareListState.loaded(shareList: shareList),
        );
      });
    });
  }
}
