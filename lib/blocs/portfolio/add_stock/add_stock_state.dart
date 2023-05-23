part of 'add_stock_cubit.dart';

@freezed
class AddStockState with _$AddStockState {
  const factory AddStockState.initial() = _Initial;
  const factory AddStockState.loading() = _Loading;
  const factory AddStockState.success() = _Success;
  const factory AddStockState.failed() = _Failed;
}
