import 'package:drift/drift.dart';

class NepseTimeSeriesInfo extends Table {
  TextColumn get date => text()();
  TextColumn get index => text()();
  TextColumn get pointChange => text()();
  TextColumn get percentageChange => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (date)',
      ];
}
