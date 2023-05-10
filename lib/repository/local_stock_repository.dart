import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>?> getLocalStockList();
  Future<List<LocalStockDataModel>?> getStockWatchlist();
}

@LazySingleton(as: LocalStockRepository)
class LocalStockRepositoryImpl implements LocalStockRepository {
  final LocalStockListDAO _localStockListDAO;
  final StockWatchlistDAO _stockWatchlistDAO;

  LocalStockRepositoryImpl(
    this._localStockListDAO,
    this._stockWatchlistDAO,
  );

  @override
  Future<List<LocalStockDataModel>> getLocalStockList() async {
    final localStockList = await _localStockListDAO.getLocalStockList() ?? [];
    return localStockList;
  }

  @override
  Future<List<LocalStockDataModel>?> getStockWatchlist() async {
    final stockWatchlist = await _stockWatchlistDAO.getStockWatchList() ?? [];
    return stockWatchlist;
  }
}
