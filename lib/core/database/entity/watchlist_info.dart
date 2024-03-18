import 'package:drift/drift.dart';

class WatchlistInfo extends Table {
  TextColumn get symbol => text()();
  TextColumn get companyName => text()();
  TextColumn get sectorName => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (symbol)',
      ];
}
