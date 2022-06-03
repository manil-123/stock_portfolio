// "companyName": "Khanikhola Hydropower Co. Ltd.",
// "symbol": "KKHC",
// "LTP": "357.30",
// "change": "-9.98",
// "quantity": "47,029"

class TopLosersModel {
  String? companyName;
  String? symbol;
  String? ltp;
  String? change;
  String? quantity;

  TopLosersModel(
      {this.companyName, this.symbol, this.ltp, this.change, this.quantity});

  factory TopLosersModel.fromJson(Map<String, dynamic> json) {
    return TopLosersModel(
      companyName: json['companyName'],
      symbol: json['symbol'],
      ltp: json['LTP'],
      change: json['change'],
      quantity: json['quantity'],
    );
  }
}
