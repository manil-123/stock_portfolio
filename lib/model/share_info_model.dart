// "companyName": "Aarambha Chautari Laghubitta Bittiya Sanstha Limited",
// "symbol": "ACLBSL",
// "LTP": "1,552.00",
// "change": "0.84"

class ShareInfoModel {
  String? companyName;
  String? symbol;
  String? ltp;
  String? change;

  ShareInfoModel({this.companyName, this.symbol, this.ltp, this.change});

  factory ShareInfoModel.fromJson(Map<String, dynamic> json) {
    return ShareInfoModel(
      companyName: json['companyName'],
      symbol: json['symbol'],
      ltp: json['LTP'],
      change: json['change'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['companyName'] = companyName;
    map['symbol'] = symbol;
    map['ltp'] = ltp;
    map['change'] = change;
    return map;
  }
}
