import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/stock_info.dart';
import 'package:share_portfolio/model/stock/stock_info_model.dart';

part 'stock_dao.g.dart';

@DriftAccessor(tables: [StockInfo])
@LazySingleton()
class StockDao extends DatabaseAccessor<AppDB> with _$StockDaoMixin {
  StockDao(AppDB db) : super(db);

  Future<List<StockInfoModel>> getAllStocksData() async {
    final stockInfoDataList = await (select(stockInfo)).get();
    return stockInfoDataList
        .map(
          (data) => StockInfoModel(
            companyName: data.companyName,
            symbol: data.symbol,
            ltp: data.ltp,
            change: data.change,
          ),
        )
        .toList();
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
