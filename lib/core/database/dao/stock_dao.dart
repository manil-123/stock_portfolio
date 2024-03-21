import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/stock_info.dart';

part 'stock_dao.g.dart';

@DriftAccessor(tables: [StockInfo])
@LazySingleton()
class StockDao extends DatabaseAccessor<AppDB> with _$StockDaoMixin {
  StockDao(AppDB db) : super(db);

  Future<List<StockInfoData>> getAllStocksData() {
    return (select(stockInfo)).get();
  }

  Future insertStockInfo(Insertable<StockInfoData> stockInfoData) =>
      into(stockInfo).insert(stockInfoData, mode: InsertMode.insertOrReplace);

  Future updateStockInfo(
      StockInfoCompanion stockInfoData, String symbol) async {
    return (update(stockInfo)..where((t) => t.symbol.equals(symbol))).write(
      stockInfoData,
    );
  }

  Future deleteAll() async {
    return (delete(stockInfo)).go();
  }
}
