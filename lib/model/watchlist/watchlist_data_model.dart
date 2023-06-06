import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_data_model.freezed.dart';
part 'watchlist_data_model.g.dart';

@freezed
class WatchlistDataModel with _$WatchlistDataModel {
  const factory WatchlistDataModel({
    int? id,
    required String scrip,
    required String companyName,
    required String sectorName,
    required double price,
  }) = _WatchlistDataModel;

  factory WatchlistDataModel.fromJson(Map<String, dynamic> json) =>
      _$WatchlistDataModelFromJson(json);
}
