import 'package:share_portfolio/features/market/models/stock_info_model.dart';

class StockInfoList {
  List<StockInfoModel>? shareInfoList;

  StockInfoList({this.shareInfoList});

  Map<String, dynamic> toMap() {
    return {
      "list": shareInfoList != null
          ? List<dynamic>.from(shareInfoList!.map((x) => x.toJson())).toList()
          : []
    };
  }

  factory StockInfoList.fromMap(Map<String, dynamic> map) {
    return StockInfoList(
      shareInfoList: map['list']
          .map((x) => StockInfoModel.fromJson(x))
          .toList()
          .cast<StockInfoModel>(),
    );
  }
}
