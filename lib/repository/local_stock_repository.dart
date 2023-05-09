import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/app/database/share_info_dao.dart';
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>> getLocalStockList();
  Future<List<LocalStockDataModel>> getStockWatchlist();
  Future<int> insertShareInfoList({List<ShareInfoModel>? shareInfoList});
  Future<int> addStockToPortfolio(LocalStockDataModel localStockData);
  Future<int> deleteStock(LocalStockDataModel localStockData);
}

@LazySingleton(as: LocalStockRepository)
class LocalStockRepositoryImpl implements LocalStockRepository {
  final LocalStockListDAO _localStockListDAO;
  final StockWatchlistDAO _stockWatchlistDAO;
  final ShareInfoListDAO _shareInfoListDAO;

  LocalStockRepositoryImpl(
    this._localStockListDAO,
    this._stockWatchlistDAO,
    this._shareInfoListDAO,
  );

  @override
  Future<List<LocalStockDataModel>> getLocalStockList() async {
    final localStockList = await _localStockListDAO.getLocalStockList() ?? [];
    return localStockList;
  }

  @override
  Future<List<LocalStockDataModel>> getStockWatchlist() async {
    final stockWatchlist = await _stockWatchlistDAO.getStockWatchList() ?? [];
    return stockWatchlist;
  }

  @override
  Future<int> insertShareInfoList({List<ShareInfoModel>? shareInfoList}) async {
    final value = _shareInfoListDAO.insert(
      ShareInfoList(shareInfoList: shareInfoList),
    );
    return value;
  }

  @override
  Future<int> addStockToPortfolio(LocalStockDataModel localStockData) async {
    return await _localStockListDAO.insert(localStockData);
  }

  @override
  Future<int> deleteStock(LocalStockDataModel localStockData) async {
    return await _localStockListDAO.delete(localStockData);
  }
}
