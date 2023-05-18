import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_losers_model.freezed.dart';
part 'top_losers_model.g.dart';

class TopLosersListResponse {
  List<TopLosersModel>? topLosersListData;

  TopLosersListResponse(this.topLosersListData);

  TopLosersListResponse.fromJson(List<Map<String, dynamic>> json) {
    if (json.isNotEmpty) {
      topLosersListData = <TopLosersModel>[];
      for (var v in json) {
        topLosersListData!.add(TopLosersModel.fromJson(v));
      }
    }
  }
}

@freezed
class TopLosersModel with _$TopLosersModel {
  const factory TopLosersModel({
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
    required String quantity,
  }) = _TopLosersModel;

  factory TopLosersModel.fromJson(Map<String, dynamic> json) =>
      _$TopLosersModelFromJson(json);
}
