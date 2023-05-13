import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_gainers_model.freezed.dart';
part 'top_gainers_model.g.dart';

class TopGainersListResponse {
  List<TopGainersModel>? topGainersListData;

  TopGainersListResponse(this.topGainersListData);

  TopGainersListResponse.fromJson(List<Map<String, dynamic>> json) {
    if (json.isNotEmpty) {
      topGainersListData = <TopGainersModel>[];
      for (var v in json) {
        topGainersListData!.add(TopGainersModel.fromJson(v));
      }
    }
  }
}

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
