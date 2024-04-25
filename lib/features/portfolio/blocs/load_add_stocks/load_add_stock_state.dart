part of 'load_add_stock_cubit.dart';

@freezed
class LoadAddStockState with _$LoadAddStockState {
  const factory LoadAddStockState.initial() = _Initial;
  const factory LoadAddStockState.loaded({
    required List<String> sectorNames,
    required List<String> companyNames,
    required Map<String, String> scripCompanyNameMap,
    required Map<String, String> companySectorNameMap,
    required MarketEnum selectedMarket,
  }) = _Loaded;
}
