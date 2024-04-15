import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/base/base_repository.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/features/home/models/nepse_price_series/nepse_time_series_data_response.dart';
import 'package:share_portfolio/features/home/models/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/services/data_service.dart';
import 'package:share_portfolio/features/home/models/top_losers/top_losers_model.dart';
import '../core/model/nepse_index_model.dart';
import '../features/stock/models/stock_info_model.dart';

abstract class NepseRepository {
  Future<Either<Failure, List<StockInfoModel>>> getStockInfoList();
  Future<Either<Failure, List<NepseTimeSeriesData>>> getNepseTimeSeriesData();
  Future<NepseIndexModel> getNepseIndex();
  Future<Either<Failure, List<TopGainersModel>>> getTopGainers();
  Future<Either<Failure, List<TopLosersModel>>> getTopLosers();
}

@LazySingleton(as: NepseRepository)
class NepseRepositoryImpl extends BaseRepository implements NepseRepository {
  final DataService _dataService;

  NepseRepositoryImpl(
    this._dataService,
  );
  @override
  Future<Either<Failure, List<StockInfoModel>>> getStockInfoList() async {
    return handleNetworkCall<List<StockInfoModel>>(
      call: _dataService.fetchShareData(),
    );
  }

  @override
  Future<Either<Failure, List<NepseTimeSeriesData>>>
      getNepseTimeSeriesData() async {
    return handleNetworkCall<List<NepseTimeSeriesData>>(
      call: _dataService.fetchNepseTimeSeriesData(),
    );
  }

  @override
  Future<NepseIndexModel> getNepseIndex() async {
    return await _dataService.getNepseIndex();
  }

  @override
  Future<Either<Failure, List<TopGainersModel>>> getTopGainers() async {
    return handleNetworkCall<List<TopGainersModel>>(
      call: _dataService.getTopGainers(),
    );
  }

  @override
  Future<Either<Failure, List<TopLosersModel>>> getTopLosers() async {
    return handleNetworkCall<List<TopLosersModel>>(
      call: _dataService.getTopLosers(),
    );
  }
}
