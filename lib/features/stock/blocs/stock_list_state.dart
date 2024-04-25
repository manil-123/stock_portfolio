part of 'stock_list_bloc.dart';

@freezed
class StockListState with _$StockListState {
  const factory StockListState.initial() = _Initial;
  const factory StockListState.loading() = _Loading;
  const factory StockListState.loaded(
      {required List<ShareInfoModel> shareList}) = _Loaded;
  const factory StockListState.failed({required Failure failure}) = _Failed;
}
