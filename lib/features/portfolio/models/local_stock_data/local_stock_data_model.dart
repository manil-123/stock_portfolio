import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_stock_data_model.freezed.dart';
part 'local_stock_data_model.g.dart';

@freezed
class LocalStockDataModel with _$LocalStockDataModel {
  const factory LocalStockDataModel({
    int? id,
    required String scrip,
    required String companyName,
    required String sectorName,
    required int quantity,
    required double price,
  }) = _LocalStockDataModel;

  factory LocalStockDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocalStockDataModelFromJson(json);
}
