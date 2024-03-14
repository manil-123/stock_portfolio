import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/model/home/nepse_price_series/nepse_time_series_data_response.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/services/scrapper.dart';
import 'dart:convert';
import '../model/stock/share_info_model.dart';
import 'dart:async';

@LazySingleton()
class DataService {
  final Scrapper scrapper;

  DataService(this.scrapper);
  Future<List<ShareInfoModel>> fetchShareData() async {
    final response = await scrapper.fetchStockData();
    final shareInfoList = ShareInfoList.fromMap(response);
    return shareInfoList.shareInfoList ?? [];
  }

  Future<List<NepseTimeSeriesData>> fetchNepseTimeSeriesData() async {
    final response = await scrapper.fetchNepsePriceHistory();
    final timeSeriesList = NepseTimeSeriesDataResponse.fromJson(
        response['price_history'] as List<Map<String, dynamic>>);
    return timeSeriesList.nepseTimeSeriesDataList ?? [];
  }

  Future<NepseIndexModel> getNepseIndex() async {
    final response = await http.get(Uri.parse(URLConstants.NEPSE_INDEX_URL));
    try {
      if (response.statusCode == 200) {
        final parsed = await json.decode(response.body);
        final data = json.decode(parsed);
        return NepseIndexModel.fromJson((data as List)[0]);
      } else
        return NepseIndexModel();
    } catch (e) {
      debugPrint(e.toString());
      return NepseIndexModel();
    }
  }

  Future<List<TopGainersModel>> getTopGainers() async {
    final response = await scrapper.fetchTopGainersData();
    final topGainersList = TopGainersListResponse.fromJson(
        response['top_gainers'] as List<Map<String, dynamic>>);
    return topGainersList.topGainersListData ?? [];
  }

  Future<List<TopLosersModel>> getTopLosers() async {
    final response = await scrapper.fetchTopLosersData();
    final topLosersList = TopLosersListResponse.fromJson(
        response['top_losers'] as List<Map<String, dynamic>>);
    return topLosersList.topLosersListData ?? [];
  }
}
