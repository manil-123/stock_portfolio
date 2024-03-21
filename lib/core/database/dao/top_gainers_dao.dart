import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/top_gainers_info.dart';

part 'top_gainers_dao.g.dart';

@DriftAccessor(tables: [TopGainersInfo])
@LazySingleton()
class TopGainersDao extends DatabaseAccessor<AppDB> with _$TopGainersDaoMixin {
  TopGainersDao(AppDB db) : super(db);

  Future<List<TopGainersInfoData>> getAllTopGainersData() {
    return (select(topGainersInfo)).get();
  }

  Future insertTopGainersInfo(
          Insertable<TopGainersInfoData> topGainersInfoData) =>
      into(topGainersInfo)
          .insert(topGainersInfoData, mode: InsertMode.insertOrReplace);

  Future updateNepseInfo(
      TopGainersInfoCompanion topGainersInfoData, String symbol) async {
    return (update(topGainersInfo)..where((t) => t.symbol.equals(symbol)))
        .write(
      topGainersInfoData,
    );
  }

  Future deleteAll() async {
    return (delete(topGainersInfo)).go();
  }
}
