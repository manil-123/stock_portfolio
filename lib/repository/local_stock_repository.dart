import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/database/dao/local_stock_dao.dart';
import 'package:share_portfolio/core/database/dao/watchlist_dao.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
import 'package:share_portfolio/core/utils/market_helper.dart';
import 'package:share_portfolio/features/portfolio/models/excel_stock_data/excel_stock_data_model.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/features/portfolio/models/pie_chart_data_model.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>> getLocalStockList();
  Future<List<WatchlistDataModel>> getStockWatchlist();
  Future<void> addStockToPortfolio(LocalStockDataModel localStockData);
  Future<void> deleteStockFromPortfolio(LocalStockDataModel localStockData);
  Future<int> addToWatchlist(WatchlistDataModel watchlistDataModel);
  Future<void> removeFromWatchlist(WatchlistDataModel watchlistDataModel);
  Future<List<PieChartDataModel>> getPieChartData();
  Future<int> importExcelToPortfolio(List<ExcelStockDataModel> excelDataList);
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

  @override
  Future<List<PieChartDataModel>> getPieChartData() async {
    final localStockList = await _localStockDao.getAllStocksData();
    final sectorsList =
        localStockList.map((stock) => stock.sectorName).toList();
    Map<String, int> sectorCount = await countSectors(sectorsList);

    final List<PieChartDataModel> pieChartDataModelList = [];
    sectorCount.forEach((sector, count) {
      pieChartDataModelList.add(
        PieChartDataModel(
            sectorName: sector, value: (count / sectorsList.length) * 100),
      );
    });
    return pieChartDataModelList;
  }

  @override
  Future<int> importExcelToPortfolio(
      List<ExcelStockDataModel> excelDataList) async {
    try {
      for (var excelData in excelDataList) {
        final companyName = MarketHelper.getCompanyName(excelData.scrip);
        final localStockData = LocalStockDataModel(
          scrip: excelData.scrip,
          companyName: companyName,
          sectorName: MarketHelper.getSector(companyName),
          quantity: excelData.quantity,
          price: excelData.price,
        );
        addStockToPortfolio(localStockData);
      }
      return 1;
    } catch (e) {
      return 0;
    }
  }

  Future<Map<String, int>> countSectors(List<String> sectorsList) async {
    Map<String, int> sectorCount = {};

    // Count the occurrences of each sector
    for (String sector in sectorsList) {
      if (sectorCount.containsKey(sector)) {
        sectorCount[sector] = sectorCount[sector]! + 1;
      } else {
        sectorCount[sector] = 1;
      }
    }
    return sectorCount;
  }
}
