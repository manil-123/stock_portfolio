import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
import 'package:share_portfolio/model/home/top_gainers_model.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
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
    final topGainers = await scrapper.fetchTopGainersData();
    try {
      final shareInfoList = ShareInfoList.fromMap(response);
      return shareInfoList.shareInfoList ?? [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<NepseIndexModel?> getNepseIndex() async {
    final response = await http.get(Uri.parse(URLConstants.NEPSE_INDEX_URL));
    try {
      if (response.statusCode == 200) {
        final parsed = await json.decode(response.body);
        final data = json.decode(parsed);
        return NepseIndexModel.fromJson((data as List)[0]);
      } else
        return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<TopGainersModel>?> getTopGainers() async {
    final response = await http.get(Uri.parse(URLConstants.TOP_GAINERS_URL));
    try {
      if (response.statusCode == 200) {
        final parsed = await json.decode(response.body);
        return parsed
            .map<TopGainersModel>((json) => TopGainersModel.fromJson(json))
            .toList();
      } else
        return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<TopLosersModel>?> getTopLosers() async {
    final response = await http.get(Uri.parse(URLConstants.TOP_LOSERS_URL));
    try {
      if (response.statusCode == 200) {
        final parsed = await json.decode(response.body);
        return parsed
            .map<TopLosersModel>((json) => TopLosersModel.fromJson(json))
            .toList();
      } else
        return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
