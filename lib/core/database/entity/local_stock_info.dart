import 'package:drift/drift.dart';

class LocalStockInfo extends Table {
  TextColumn get scrip => text()();
  TextColumn get companyName => text()();
  TextColumn get sectorName => text()();
  TextColumn get quantity => text()();
  TextColumn get price => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (scrip)',
      ];
}
