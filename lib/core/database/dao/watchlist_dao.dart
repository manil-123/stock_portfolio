import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/watchlist_info.dart';

part 'watchlist_dao.g.dart';

@DriftAccessor(tables: [WatchlistInfo])
@LazySingleton()
class WatchlistDao extends DatabaseAccessor<AppDB> with _$WatchlistDaoMixin {
  WatchlistDao(AppDB db) : super(db);

  Future<List<WatchlistInfoData>> getAllWatchlistData() {
    return (select(watchlistInfo)).get();
  }

  Future<WatchlistInfoData?> getDataByScrip(String symbol) {
    return (select(watchlistInfo)..where((tbl) => tbl.symbol.equals(symbol)))
        .getSingleOrNull();
  }

  Future<int> insertWatchlistInfo(
      Insertable<WatchlistInfoData> watchlistInfoData) async {
    final localStockCompanion = watchlistInfoData as WatchlistInfoCompanion;
    final oldData = await getDataByScrip(localStockCompanion.symbol.value);
    if (oldData != null) {
      return 0;
    } else {
      return into(watchlistInfo)
          .insert(watchlistInfoData, mode: InsertMode.insert);
    }
  }

  Future updateWatchlistInfo(
      WatchlistInfoCompanion watchlistInfoData, String symbol) async {
    return (update(watchlistInfo)..where((t) => t.symbol.equals(symbol))).write(
      watchlistInfoData,
    );
  }

  deleteSingle(String symbol) {
    return (delete(watchlistInfo)
          ..where(
            (tbl) => tbl.symbol.equals(symbol),
          ))
        .go();
  }

  Future deleteAll() async {
    return (delete(watchlistInfo)).go();
  }
}
