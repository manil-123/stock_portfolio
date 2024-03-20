import 'package:drift/drift.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/nepse_info.dart';

part 'nepse_dao.g.dart';

@DriftAccessor(tables: [NepseInfo])
class UserDao extends DatabaseAccessor<AppDB> with _$UserDaoMixin {
  UserDao(AppDB db) : super(db);

  Future<NepseInfoData?> getNepseInfo() => select(nepseInfo).getSingleOrNull();

  Future insertNepseInfo(Insertable<NepseInfoData> nepseInfoData) =>
      into(nepseInfo).insert(nepseInfoData, mode: InsertMode.insertOrReplace);

  Future updateNepseInfo(
      NepseInfoCompanion nepseInfoData, String userId) async {
    return (update(nepseInfo)..where((t) => t.id.equals(userId))).write(
      nepseInfoData,
    );
  }

  Future deleteNepseInfo() async {
    return (delete(nepseInfo)).go();
  }
}
