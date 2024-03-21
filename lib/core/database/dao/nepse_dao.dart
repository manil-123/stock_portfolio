import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/nepse_timeseries_info.dart';

part 'nepse_dao.g.dart';

@DriftAccessor(tables: [NepseTimeSeriesInfo])
@LazySingleton()
class NepseDao extends DatabaseAccessor<AppDB> with _$NepseDaoMixin {
  NepseDao(AppDB db) : super(db);

  Future<List<NepseTimeSeriesInfoData>> getAllNepseData() {
    return (select(nepseTimeSeriesInfo)).get();
  }

  Future<NepseTimeSeriesInfoData?> getNepseInfo() =>
      select(nepseTimeSeriesInfo).getSingleOrNull();

  Future insertNepseInfo(Insertable<NepseTimeSeriesInfoData> nepseInfoData) =>
      into(nepseTimeSeriesInfo)
          .insert(nepseInfoData, mode: InsertMode.insertOrReplace);

  Future updateNepseInfo(
      NepseTimeSeriesInfoCompanion nepseInfoData, String date) async {
    return (update(nepseTimeSeriesInfo)..where((t) => t.date.equals(date)))
        .write(
      nepseInfoData,
    );
  }

  Future deleteNepseInfo() async {
    return (delete(nepseTimeSeriesInfo)).go();
  }
}
