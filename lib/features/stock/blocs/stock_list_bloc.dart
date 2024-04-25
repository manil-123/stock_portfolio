import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';
import 'package:share_portfolio/repository/nepse_repository.dart';

part 'stock_list_event.dart';
part 'stock_list_state.dart';
part 'stock_list_bloc.freezed.dart';

@LazySingleton()
class StockListBloc extends Bloc<StockListEvent, StockListState> {
  final NepseRepository _nepseRepo;
  StockListBloc(
    this._nepseRepo,
  ) : super(
          const StockListState.initial(),
        ) {
    on<_LoadShareList>((event, emit) async {
      emit(
        const StockListState.loading(),
      );
      final shareListResponse = await _nepseRepo.getShareInfoList();
      shareListResponse.fold((failure) {
        emit(
          StockListState.failed(failure: failure),
        );
      }, (shareList) {
        emit(
          StockListState.loaded(shareList: shareList),
        );
      });
    });
  }
}
