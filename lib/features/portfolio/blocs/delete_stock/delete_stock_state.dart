part of 'delete_stock_cubit.dart';

@freezed
class DeleteStockState with _$DeleteStockState {
  const factory DeleteStockState.initial() = _Initial;
  const factory DeleteStockState.loading() = _Loading;
  const factory DeleteStockState.success() = _Success;
  const factory DeleteStockState.failed() = _Failed;
}
