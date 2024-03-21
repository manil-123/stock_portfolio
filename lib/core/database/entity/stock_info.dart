import 'package:drift/drift.dart';

class StockInfo extends Table {
  TextColumn get symbol => text()();
  TextColumn get companyName => text()();
  TextColumn get ltp => text()();
  TextColumn get change => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (symbol)',
      ];
}
