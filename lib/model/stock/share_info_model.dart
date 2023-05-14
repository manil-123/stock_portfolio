import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_info_model.freezed.dart';
part 'share_info_model.g.dart';

@freezed
class ShareInfoModel with _$ShareInfoModel {
  const factory ShareInfoModel({
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
  }) = _ShareInfoModel;

  factory ShareInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ShareInfoModelFromJson(json);
}
