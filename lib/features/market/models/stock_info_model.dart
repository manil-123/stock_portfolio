import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info_model.freezed.dart';
part 'stock_info_model.g.dart';

@freezed
class StockInfoModel with _$StockInfoModel {
  const factory StockInfoModel({
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
  }) = _StockInfoModel;

  factory StockInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StockInfoModelFromJson(json);
}
