import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_gainers_model.freezed.dart';
part 'top_gainers_model.g.dart';

@freezed
class TopGainersModel with _$TopGainersModel {
  const factory TopGainersModel({
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
    required String quantity,
  }) = _TopGainersModel;

  factory TopGainersModel.fromJson(Map<String, dynamic> json) =>
      _$TopGainersModelFromJson(json);
}
