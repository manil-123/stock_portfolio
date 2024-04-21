part of 'import_stock_cubit.dart';

@freezed
class ImportStockState with _$ImportStockState {
  factory ImportStockState({
    required String fileName,
    required List<ExcelStockDataModel> excelDataList,
  }) = _ImportStockState;
}
