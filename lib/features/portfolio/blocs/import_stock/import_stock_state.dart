part of 'import_stock_cubit.dart';

@freezed
class ImportStockState with _$ImportStockState {
  const factory ImportStockState.initial() = _Initial;
  const factory ImportStockState.loading() = _Loading;
  const factory ImportStockState.success() = _Success;
  const factory ImportStockState.failed() = _Failed;
}
