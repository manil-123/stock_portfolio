import 'package:freezed_annotation/freezed_annotation.dart';

part 'nepse_time_series_data_response.freezed.dart';
part 'nepse_time_series_data_response.g.dart';

class NepseTimeSeriesDataResponse {
  List<NepseTimeSeriesData>? nepseTimeSeriesDataList;

  NepseTimeSeriesDataResponse(this.nepseTimeSeriesDataList);

  NepseTimeSeriesDataResponse.fromJson(List<Map<String, dynamic>> json) {
    if (json.isNotEmpty) {
      nepseTimeSeriesDataList = <NepseTimeSeriesData>[];
      for (var v in json) {
        nepseTimeSeriesDataList!.add(NepseTimeSeriesData.fromJson(v));
      }
    }
  }
}

@freezed
class NepseTimeSeriesData with _$NepseTimeSeriesData {
  const factory NepseTimeSeriesData({
    required String? date,
    required double? index,
    required double? pointChange,
    required double? percentageChange,
  }) = _NepseTimeSeriesData;

  factory NepseTimeSeriesData.fromJson(Map<String, dynamic> json) =>
      _$NepseTimeSeriesDataFromJson(json);
}
