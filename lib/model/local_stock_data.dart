class LocalStockData {
  int? id;
  String? scrip;
  String? companyName;
  String? sectorName;
  int? quantity;
  double? price;

  LocalStockData({
    this.scrip,
    this.companyName,
    this.quantity,
    this.price,
    this.sectorName,
  });

  // Convert a ShareData object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['scrip'] = scrip;
    map['companyName'] = companyName;
    map['sectorName'] = sectorName;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }

  // Extract a ShareData object from a Map object
  factory LocalStockData.fromJson(Map<String, dynamic> json) {
    return LocalStockData(
      scrip: json['scrip'],
      companyName: json['companyName'],
      quantity: json['quantity'],
      price: json['price'],
      sectorName: json['sectorName'],
    );
  }
}
