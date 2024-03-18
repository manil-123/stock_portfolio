import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart';
import 'package:share_portfolio/core/database/dao/local_stock_dao.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>> getLocalStockList();
  Future<List<WatchlistDataModel>> getStockWatchlist();
  Future<int> addStockToPortfolio(LocalStockDataModel localStockData);
  Future<int> deleteStockFromPortfolio(LocalStockDataModel localStockData);
  Future<int> addToWatchlist(WatchlistDataModel watchlistDataModel);
  Future<int> removeFromWatchlist(WatchlistDataModel watchlistDataModel);
}

@LazySingleton(as: LocalStockRepository)
class LocalStockRepositoryImpl implements LocalStockRepository {
  final LocalStockDao _localStockDao;
  final StockWatchlistDAO _stockWatchlistDAO;

  LocalStockRepositoryImpl(
    this._localStockDao,
    this._stockWatchlistDAO,
  );

  @override
  Future<List<LocalStockDataModel>> getLocalStockList() async {
    final localStockList = await _localStockDao.getAllStocksData();
    return localStockList;
  }

  @override
  Future<List<WatchlistDataModel>> getStockWatchlist() async {
    final stockWatchlist = await _stockWatchlistDAO.getStockWatchList() ?? [];
    return stockWatchlist;
  }

  @override
  Future<int> addStockToPortfolio(LocalStockDataModel localStockData) async {
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
  Future<int> deleteStockFromPortfolio(
      LocalStockDataModel localStockData) async {
    return await _localStockDao.deleteSingle(localStockData.scrip);
  }

  @override
  Future<int> addToWatchlist(WatchlistDataModel watchlistDataModel) async {
    return await _stockWatchlistDAO.insert(watchlistDataModel);
  }

  @override
  Future<int> removeFromWatchlist(WatchlistDataModel watchlistDataModel) async {
    return await _stockWatchlistDAO.delete(watchlistDataModel);
  }
}
