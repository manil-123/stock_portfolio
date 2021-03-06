import 'package:share_portfolio/model/share_info_model.dart';

class ShareInfoList {
  List<ShareInfoModel>? shareInfoList;

  ShareInfoList({this.shareInfoList});

  Map<String, dynamic> toMap() {
    return {
      "list": List<dynamic>.from(shareInfoList!.map((x) => x.toJson())).toList()
    };
  }

  static ShareInfoList fromMap(Map<String, dynamic> map) {
    return ShareInfoList(
      shareInfoList: map['list']
          .map((x) => ShareInfoModel.fromJson(x))
          .toList()
          .cast<ShareInfoModel>(),
    );
  }
}
