import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/core/error/failures.dart';
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
    try {
      final shareInfoList = ShareInfoList.fromMap(response);
      return shareInfoList.shareInfoList ?? [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
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

  Future<Either<Failure, List<TopGainersModel>>> getTopGainers() async {
    final response = await scrapper.fetchTopGainersData();
    try {
      final topGainersList = TopGainersListResponse.fromJson(
          response['top_gainers'] as List<Map<String, dynamic>>);
      return Right(topGainersList.topGainersListData ?? []);
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        Failure.scrapFailure(
          failureMessage: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<TopLosersModel>>> getTopLosers() async {
    final response = await scrapper.fetchTopLosersData();
    try {
      final topLosersList = TopLosersListResponse.fromJson(
          response['top_losers'] as List<Map<String, dynamic>>);
      return Right(topLosersList.topLosersListData ?? []);
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        Failure.scrapFailure(
          failureMessage: e.toString(),
        ),
      );
    }
  }
}
