import 'package:drift/drift.dart';

class NepseInfo extends Table {
  TextColumn get id => text()();
  TextColumn get date => text()();
  TextColumn get index => text()();
  TextColumn get pointChange => text()();
  TextColumn get percentageChange => text()();

  @override
  List<String> get customConstraints => [
        'PRIMARY KEY (id), UNIQUE (date)',
      ];
}
