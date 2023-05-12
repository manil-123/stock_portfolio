import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/services/data_service.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import '../model/nepse_index_model.dart';
import '../model/stock/share_info_model.dart';

abstract class NepseRepository {
  Future<List<ShareInfoModel>> getShareInfoList();
  Future<NepseIndexModel> getNepseIndex();
  Future<Either<Failure, List<TopGainersModel>>> getTopGainers();
  Future<List<TopLosersModel>> getTopLosers();
}

@LazySingleton(as: NepseRepository)
class NepseRepositoryImpl implements NepseRepository {
  final DataService _dataService;

  NepseRepositoryImpl(this._dataService);
  @override
  Future<List<ShareInfoModel>> getShareInfoList() async {
    return await _dataService.fetchShareData();
  }

  @override
  Future<NepseIndexModel> getNepseIndex() async {
    return await _dataService.getNepseIndex();
  }

  @override
  Future<Either<Failure, List<TopGainersModel>>> getTopGainers() async {
    return await _dataService.getTopGainers();
  }

  @override
  Future<List<TopLosersModel>> getTopLosers() async {
    return await _dataService.getTopLosers();
  }
}
