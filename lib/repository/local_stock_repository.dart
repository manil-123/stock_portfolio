import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

abstract class LocalStockRepository {
  Future<List<LocalStockDataModel>?> getLocalStockList();
}

@LazySingleton(as: LocalStockRepository)
class LocalStockRepositoryImpl implements LocalStockRepository {
  final LocalStockListDAO _localStockListDAO;

  LocalStockRepositoryImpl(this._localStockListDAO);

  @override
  Future<List<LocalStockDataModel>> getLocalStockList() async {
    final localStockList = await _localStockListDAO.getLocalStockList() ?? [];
    return localStockList;
  }
}
