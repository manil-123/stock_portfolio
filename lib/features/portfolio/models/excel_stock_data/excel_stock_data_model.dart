class ExcelStockDataModel {
  String scrip;
  String transactionTpe;
  int quantity;
  double price;

  ExcelStockDataModel({
    required this.scrip,
    required this.transactionTpe,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "scrip": scrip,
      "transactionTpe": transactionTpe,
      "quantity": quantity,
      "price": price,
    };
  }
}
