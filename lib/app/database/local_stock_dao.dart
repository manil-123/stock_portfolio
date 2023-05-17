import 'package:sembast/sembast.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import '../../config/database.dart';

class LocalStockListDAO {
  static const String LOCAL_STOCK_LIST_STORE_NAME = 'localstocklist';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _localStockListStore =
      intMapStoreFactory.store(LOCAL_STOCK_LIST_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<List<LocalStockData>?> getLocalStockList() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('companyName'),
    ]);

    final recordSnapshots = await _localStockListStore.find(
      await _db,
      finder: finder,
    );
    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final localStockData = LocalStockData.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      localStockData.id = snapshot.key;
      return localStockData;
    }).toList();
  }

  Future insert(LocalStockData localStockData) async {
    var localDataList = await getLocalStockList();
    int? updateId;
    int result = 0;
    LocalStockData? localUpdatedData;
    for (var i in localDataList!) {
      if (i.companyName == localStockData.companyName) {
        updateId = i.id;
        result = 1;
        localUpdatedData = LocalStockData(
          companyName: localStockData.companyName,
          scrip: localStockData.scrip,
          quantity: (i.quantity! + localStockData.quantity!),
          price: (i.price! * i.quantity!.toDouble() +
                  localStockData.price! * localStockData.quantity!.toDouble()) /
              (i.quantity!.toDouble() + localStockData.quantity!.toDouble()),
          sectorName: localStockData.sectorName,
        );

        break;
      }
    }
    if (result == 0) {
      await _localStockListStore.add(await _db, localStockData.toMap());
    } else {
      update(localUpdatedData!, updateId);
    }
  }

  Future update(LocalStockData localStockData, int? id) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(id));
    await _localStockListStore.update(
      await _db,
      localStockData.toMap(),
      finder: finder,
    );
  }

  Future delete(LocalStockData localStockData) async {
    final finder = Finder(filter: Filter.byKey(localStockData.id));
    await _localStockListStore.delete(
      await _db,
      finder: finder,
    );
  }
}
