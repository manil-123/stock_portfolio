import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:share_portfolio/app/database/app_database.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

@LazySingleton()
class StockWatchlistDAO {
  static const String STOCK_WATCHLIST_STORE_NAME = 'stockwatchlistlist';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _stockWatchlistStore =
      intMapStoreFactory.store(STOCK_WATCHLIST_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<List<LocalStockDataModel>?> getStockWatchList() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('companyName'),
    ]);

    final recordSnapshots = await _stockWatchlistStore.find(
      await _db,
      finder: finder,
    );
    // Making a List<LocalStockData> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final localStockData = LocalStockDataModel.fromJson(snapshot.value);
      // An ID is a key of a record from the database.

      return localStockData.copyWith(id: snapshot.key);
    }).toList();
  }

  Future<String> insert(LocalStockDataModel localStockData) async {
    var localDataList = await getStockWatchList();
    int result = 0;
    for (var oldLocalStockData in localDataList!) {
      if (oldLocalStockData.companyName == localStockData.companyName) {
        result = 1;
        break;
      }
    }
    if (result == 0) {
      await _stockWatchlistStore.add(
        await _db,
        localStockData.toJson(),
      );
      return 'Stock successfully added in the watchlist';
    } else {
      return 'Stock already in the watchlist';
    }
  }

  Future delete(LocalStockDataModel localStockData) async {
    final finder = Finder(filter: Filter.byKey(localStockData.id));
    await _stockWatchlistStore.delete(
      await _db,
      finder: finder,
    );
  }
}
