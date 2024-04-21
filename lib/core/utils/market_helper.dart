import 'package:share_portfolio/core/model/list_data_model.dart';

class MarketHelper {
  static String getCompanyName(String scrip) {
    return ListDataModel.scripCompanyNameData[scrip] ?? '';
  }

  static String getSector(String companyName) {
    return ListDataModel.companySectorData[companyName] ?? '';
  }
}
