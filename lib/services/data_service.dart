import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/core/database/dao/nepse_timeseries_dao.dart';
import 'package:share_portfolio/core/database/dao/stock_dao.dart';
import 'package:share_portfolio/core/database/dao/top_gainers_dao.dart';
import 'package:share_portfolio/core/database/dao/top_losers_dao.dart';
import 'package:share_portfolio/core/database/db/app_db.dart';
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
  final NepseTimeSeriesDao _nepseTimeSeriesDao;
  final TopGainersDao _topGainersDao;
  final TopLosersDao _topLosersDao;
  final StockDao _stockDao;

  DataService(
    this.scrapper,
    this._nepseTimeSeriesDao,
    this._topGainersDao,
    this._topLosersDao,
    this._stockDao,
  );

  Future<List<ShareInfoModel>> fetchShareData() async {
    try {
      final response = await scrapper.fetchStockData();
      final shareInfoList = ShareInfoList.fromMap(response);
      //* Store Nepse Stock data after deleting all previous records
      _stockDao.deleteAll();
      for (var item in shareInfoList.shareInfoList!) {
        _stockDao.insertStockInfo(
          StockInfoCompanion(
            symbol: Value(item.symbol),
            companyName: Value(item.companyName),
            ltp: Value(item.ltp),
            change: Value(item.change),
          ),
        );
      }
      return shareInfoList.shareInfoList ?? [];
    } catch (e) {
      final stockDataList = await _stockDao.getAllStocksData();

      if (stockDataList.isNotEmpty) {
        return stockDataList
            .map(
              (data) => ShareInfoModel(
                companyName: data.companyName,
                symbol: data.symbol,
                ltp: data.ltp,
                change: data.change,
              ),
            )
            .toList();
      } else {
        rethrow;
      }
    }
  }

  Future<List<NepseTimeSeriesData>> fetchNepseTimeSeriesData() async {
    try {
      final response = await scrapper.fetchNepsePriceHistory();
      final timeSeriesList = NepseTimeSeriesDataResponse.fromJson(
          response['price_history'] as List<Map<String, dynamic>>);
      //* Store Nepse TimeSeries data after deleting all previous records
      _nepseTimeSeriesDao.deleteAll();
      for (var item in timeSeriesList.nepseTimeSeriesDataList!) {
        _nepseTimeSeriesDao.insertNepseInfo(
          NepseTimeSeriesInfoCompanion(
            date: Value(item.date ?? ''),
            index: Value(
              item.index.toString(),
            ),
            pointChange: Value(
              item.pointChange.toString(),
            ),
            percentageChange: Value(
              item.pointChange.toString(),
            ),
          ),
        );
      }
      return timeSeriesList.nepseTimeSeriesDataList ?? [];
    } catch (e) {
      final nepseTimeSeriesDataList =
          await _nepseTimeSeriesDao.getAllNepseData();

      if (nepseTimeSeriesDataList.isNotEmpty) {
        return nepseTimeSeriesDataList
            .map(
              (data) => NepseTimeSeriesData(
                date: data.date,
                index: double.parse(data.index),
                pointChange: double.parse(data.pointChange),
                percentageChange: double.parse(data.percentageChange),
              ),
            )
            .toList();
      } else {
        rethrow;
      }
    }
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
    try {
      final response = await scrapper.fetchTopGainersData();
      final topGainersList = TopGainersListResponse.fromJson(
          response['top_gainers'] as List<Map<String, dynamic>>);
      //* Store Nepse TopGainers data after deleting all previous records
      _topGainersDao.deleteAll();
      for (var item in topGainersList.topGainersListData!) {
        _topGainersDao.insertTopGainersInfo(
          TopGainersInfoCompanion(
            symbol: Value(item.symbol),
            companyName: Value(item.companyName),
            ltp: Value(item.ltp),
            change: Value(item.change),
            quantity: Value(item.quantity),
          ),
        );
      }
      return topGainersList.topGainersListData ?? [];
    } catch (e) {
      final topGainersDataList = await _topGainersDao.getAllTopGainersData();

      if (topGainersDataList.isNotEmpty) {
        return topGainersDataList
            .map(
              (data) => TopGainersModel(
                companyName: data.companyName,
                symbol: data.symbol,
                ltp: data.ltp,
                change: data.change,
                quantity: data.quantity,
              ),
            )
            .toList();
      } else {
        rethrow;
      }
    }
  }

  Future<List<TopLosersModel>> getTopLosers() async {
    try {
      final response = await scrapper.fetchTopLosersData();
      final topLosersList = TopLosersListResponse.fromJson(
          response['top_losers'] as List<Map<String, dynamic>>);
      //* Store Nepse TopLosers data after deleting all previous records
      _topLosersDao.deleteAll();
      for (var item in topLosersList.topLosersListData!) {
        _topLosersDao.insertTopLosersInfo(
          TopLosersInfoCompanion(
            symbol: Value(item.symbol),
            companyName: Value(item.companyName),
            ltp: Value(item.ltp),
            change: Value(item.change),
            quantity: Value(item.quantity),
          ),
        );
      }
      return topLosersList.topLosersListData ?? [];
    } catch (e) {
      final topLosersDataList = await _topLosersDao.getAllTopLosersData();

      if (topLosersDataList.isNotEmpty) {
        return topLosersDataList
            .map(
              (data) => TopLosersModel(
                companyName: data.companyName,
                symbol: data.symbol,
                ltp: data.ltp,
                change: data.change,
                quantity: data.quantity,
              ),
            )
            .toList();
      } else {
        rethrow;
      }
    }
  }
}
