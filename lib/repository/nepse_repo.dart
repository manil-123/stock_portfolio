import 'package:share_portfolio/handler/data_service.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
import '../model/nepse_index_model.dart';
import '../model/share_info_model.dart';
import '../model/top_gainers_model.dart';

abstract class NepseRepoitory {
  Future<List<ShareInfoModel>?> getShareInfoList();
  Future<NepseIndexModel?> getNepseIndex();
  Future<List<TopGainersModel>?> getTopGainers();
  Future<List<TopLosersModel>?> getTopLosers();
}

class NepseRepo implements NepseRepoitory {
  @override
  Future<List<ShareInfoModel>?> getShareInfoList() async {
    return await DataService.fetchShareData();
  }

  @override
  Future<NepseIndexModel?> getNepseIndex() async {
    return await DataService.getNepseIndex();
  }

  @override
  Future<List<TopGainersModel>?> getTopGainers() async {
    return await DataService.getTopGainers();
  }

  @override
  Future<List<TopLosersModel>?> getTopLosers() async {
    return await DataService.getTopLosers();
  }
}
