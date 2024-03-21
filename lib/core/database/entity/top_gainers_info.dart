import 'package:drift/drift.dart';

class TopGainersInfo extends Table {
  TextColumn get symbol => text()();
  TextColumn get companyName => text()();
  TextColumn get ltp => text()();
  TextColumn get change => text()();
  TextColumn get quantity => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (symbol)',
      ];
}
