import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/database/entity/local_stock_info.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';

part 'local_stock_dao.g.dart';

@DriftAccessor(tables: [LocalStockInfo])
@LazySingleton()
class LocalStockDao extends DatabaseAccessor<AppDB> with _$LocalStockDaoMixin {
  LocalStockDao(AppDB db) : super(db);

  Future<List<LocalStockDataModel>> getAllStocksData() async {
    final localStockInfoDataList = await (select(localStockInfo)).get();
    final localStockDataList = localStockInfoDataList
        .map(
          (data) => LocalStockDataModel(
            scrip: data.scrip,
            companyName: data.companyName,
            sectorName: data.sectorName,
            quantity: int.parse(data.quantity),
            price: double.parse(data.price),
          ),
        )
        .toList();

    return localStockDataList;
  }

  Future<LocalStockInfoData?> getLocalStockDataByScrip(String scrip) {
    return (select(localStockInfo)..where((tbl) => tbl.scrip.equals(scrip)))
        .getSingleOrNull();
  }

  Future insertStockInfo(Insertable<LocalStockInfoData> newData) async {
    final localStockCompanion = newData as LocalStockInfoCompanion;
    final oldData =
        await getLocalStockDataByScrip(localStockCompanion.scrip.value);
    if (oldData != null) {
      final totalQuantity = ((int.parse(oldData.quantity) +
          int.parse(localStockCompanion.quantity.value)));
      final updatedLocalStockData = LocalStockInfoData(
        scrip: oldData.scrip,
        companyName: oldData.companyName,
        quantity: totalQuantity.toString(),
        price: ((double.parse(oldData.price) * int.parse(oldData.quantity) +
                    double.parse(localStockCompanion.price.value) *
                        int.parse(localStockCompanion.quantity.value)) /
                totalQuantity)
            .toString(),
        sectorName: localStockCompanion.sectorName.value,
      );
      return into(localStockInfo)
          .insert(updatedLocalStockData, mode: InsertMode.insertOrReplace);
    } else {
      return into(localStockInfo)
          .insert(newData, mode: InsertMode.insertOrReplace);
    }
  }

  /// This method to be called for [Sell] Transaction type to update quantity and price
  Future modifyStockInfo(Insertable<LocalStockInfoData> newData) async {
    final localStockCompanion = newData as LocalStockInfoCompanion;
    final oldData =
        await getLocalStockDataByScrip(localStockCompanion.scrip.value);
    if (oldData != null) {
      /// total stocks quantity
      int oldQuantity = int.parse(oldData.quantity);
      final oldPrice = double.parse(oldData.price);
      int sellQuantity = int.parse(localStockCompanion.quantity.value);

      if (oldQuantity < sellQuantity) {
        return;
      }

      /// [WACC] or average price remains unchanged for sell Transaction Type.
      final updatedLocalStockData = LocalStockInfoData(
        scrip: oldData.scrip,
        companyName: oldData.companyName,
        quantity: (oldQuantity - sellQuantity).toString(),
        price: oldPrice.toString(),
        sectorName: localStockCompanion.sectorName.value,
      );
      return into(localStockInfo)
          .insert(updatedLocalStockData, mode: InsertMode.insertOrReplace);
    }
  }

  Future updateStockInfo(
      LocalStockInfoCompanion localStockInfoData, String symbol) async {
    return (update(localStockInfo)..where((t) => t.scrip.equals(symbol))).write(
      localStockInfoData,
    );
  }

  deleteSingle(String scrip) {
    return (delete(localStockInfo)
          ..where(
            (tbl) => tbl.scrip.equals(scrip),
          ))
        .go();
  }

  Future deleteAll() async {
    return (delete(localStockInfo)).go();
  }
}
