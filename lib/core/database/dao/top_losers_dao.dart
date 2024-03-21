import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/top_losers_info.dart';

part 'top_losers_dao.g.dart';

@DriftAccessor(tables: [TopLosersInfo])
@LazySingleton()
class TopLosersDao extends DatabaseAccessor<AppDB> with _$TopLosersDaoMixin {
  TopLosersDao(AppDB db) : super(db);

  Future<List<TopLosersInfoData>> getAllTopGainersData() {
    return (select(topLosersInfo)).get();
  }

  Future insertTopGainersInfo(
          Insertable<TopLosersInfoData> topLosersInfoData) =>
      into(topLosersInfo)
          .insert(topLosersInfoData, mode: InsertMode.insertOrReplace);

  Future updateNepseInfo(
      TopLosersInfoCompanion topLosersInfoData, String symbol) async {
    return (update(topLosersInfo)..where((t) => t.symbol.equals(symbol))).write(
      topLosersInfoData,
    );
  }

  Future deleteAll() async {
    return (delete(topLosersInfo)).go();
  }
}
