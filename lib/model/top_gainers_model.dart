// "companyName": "Jeevan Bikas Laghubitta Bittiya Sanstha Limited",
// "symbol": "JBLB",
// "LTP": "4,726.30",
// "change": "10",
// "quantity": "2,881"

class TopGainersModel {
  String? companyName;
  String? symbol;
  String? ltp;
  String? change;
  String? quantity;

  TopGainersModel(
      {this.companyName, this.symbol, this.ltp, this.change, this.quantity});

  factory TopGainersModel.fromJson(Map<String, dynamic> json) {
    return TopGainersModel(
      companyName: json['companyName'],
      symbol: json['symbol'],
      ltp: json['LTP'],
      change: json['change'],
      quantity: json['quantity'],
    );
  }
}
