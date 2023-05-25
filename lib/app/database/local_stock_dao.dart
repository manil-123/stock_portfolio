import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:share_portfolio/app/database/app_database.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

@LazySingleton()
class LocalStockListDAO {
  static const String LOCAL_STOCK_LIST_STORE_NAME = 'localstocklist';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _localStockListStore =
      intMapStoreFactory.store(LOCAL_STOCK_LIST_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<List<LocalStockDataModel>?> getLocalStockList() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('companyName'),
    ]);

    final recordSnapshots = await _localStockListStore.find(
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

  Future insert(LocalStockDataModel localStockData) async {
    var localDataList = await getLocalStockList();
    int? updateId;
    int result = 0;
    for (var oldLocalStockData in localDataList!) {
      if (oldLocalStockData.companyName == localStockData.companyName) {
        updateId = oldLocalStockData.id;
        result = 1;
        localStockData = localStockData.copyWith(
          companyName: localStockData.companyName,
          scrip: localStockData.scrip,
          quantity: (oldLocalStockData.quantity + localStockData.quantity),
          price: (oldLocalStockData.price *
                      oldLocalStockData.quantity.toDouble() +
                  localStockData.price * localStockData.quantity.toDouble()) /
              (oldLocalStockData.quantity.toDouble() +
                  localStockData.quantity.toDouble()),
          sectorName: localStockData.sectorName,
        );
        break;
      }
    }
    if (result == 0) {
      await _localStockListStore.add(
        await _db,
        localStockData.toJson(),
      );
    } else {
      update(localStockData, updateId);
    }
  }

  Future update(LocalStockDataModel localStockData, int? id) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(id));
    await _localStockListStore.update(
      await _db,
      localStockData.toJson(),
      finder: finder,
    );
  }

  Future delete(LocalStockDataModel localStockData) async {
    final finder = Finder(filter: Filter.byKey(localStockData.id));
    await _localStockListStore.delete(
      await _db,
      finder: finder,
    );
  }
}
