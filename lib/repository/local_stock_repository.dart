import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/dao/local_stock_dao.dart';
import 'package:share_portfolio/core/database/dao/watchlist_dao.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>> getLocalStockList();
  Future<List<WatchlistDataModel>> getStockWatchlist();
  Future<void> addStockToPortfolio(LocalStockDataModel localStockData);
  Future<void> deleteStockFromPortfolio(LocalStockDataModel localStockData);
  Future<int> addToWatchlist(WatchlistDataModel watchlistDataModel);
  Future<void> removeFromWatchlist(WatchlistDataModel watchlistDataModel);
}

@LazySingleton(as: LocalStockRepository)
class LocalStockRepositoryImpl implements LocalStockRepository {
  final LocalStockDao _localStockDao;
  final WatchlistDao _watchlistDao;

  LocalStockRepositoryImpl(
    this._localStockDao,
    this._watchlistDao,
  );

  @override
  Future<List<LocalStockDataModel>> getLocalStockList() async {
    final localStockList = await _localStockDao.getAllStocksData();
    return localStockList;
  }

  @override
  Future<List<WatchlistDataModel>> getStockWatchlist() async {
    final stockWatchlist = await _watchlistDao.getAllWatchlistData();
    return stockWatchlist
        .map(
          (data) => WatchlistDataModel(
            symbol: data.symbol,
            companyName: data.companyName,
            sectorName: data.sectorName,
          ),
        )
        .toList();
  }

  @override
  Future<void> addStockToPortfolio(LocalStockDataModel localStockData) async {
    return await _localStockDao.insertStockInfo(
      LocalStockInfoCompanion(
        scrip: Value(localStockData.scrip),
        companyName: Value(localStockData.companyName),
        sectorName: Value(localStockData.sectorName),
        quantity: Value(
          localStockData.quantity.toString(),
        ),
        price: Value(
          localStockData.price.toString(),
        ),
      ),
    );
  }

  @override
  Future<void> deleteStockFromPortfolio(
      LocalStockDataModel localStockData) async {
    return await _localStockDao.deleteSingle(localStockData.scrip);
  }

  @override
  Future<int> addToWatchlist(WatchlistDataModel watchlistDataModel) async {
    final result = await _watchlistDao.insertWatchlistInfo(
      WatchlistInfoCompanion(
        symbol: Value(watchlistDataModel.symbol),
        companyName: Value(watchlistDataModel.companyName),
        sectorName: Value(watchlistDataModel.sectorName),
      ),
    );
    return result;
  }

  @override
  Future<void> removeFromWatchlist(
      WatchlistDataModel watchlistDataModel) async {
    return await _watchlistDao.deleteSingle(
      watchlistDataModel.symbol,
    );
  }
}
