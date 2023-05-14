import 'package:injectable/injectable.dart';
import 'package:share_portfolio/services/data_service.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
import '../model/nepse_index_model.dart';
import '../model/stock/share_info_model.dart';
import '../model/top_gainers_model.dart';

abstract class NepseRepoitory {
  Future<List<ShareInfoModel>?> getShareInfoList();
  Future<NepseIndexModel?> getNepseIndex();
  Future<List<TopGainersModel>?> getTopGainers();
  Future<List<TopLosersModel>?> getTopLosers();
}

@LazySingleton(as: NepseRepoitory)
class NepseRepositoryImpl implements NepseRepoitory {
  final DataService _dataService;

  NepseRepositoryImpl(this._dataService);
  @override
  Future<List<ShareInfoModel>> getShareInfoList() async {
    return await _dataService.fetchShareData();
  }

  @override
  Future<NepseIndexModel?> getNepseIndex() async {
    return await _dataService.getNepseIndex();
  }

  @override
  Future<List<TopGainersModel>?> getTopGainers() async {
    return await _dataService.getTopGainers();
  }

  @override
  Future<List<TopLosersModel>?> getTopLosers() async {
    return await _dataService.getTopLosers();
  }
}
