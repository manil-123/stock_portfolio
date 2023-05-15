import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/top_gainers_model.dart';
import 'package:share_portfolio/model/top_losers_model.dart';
import 'dart:convert';
import '../model/share_info_model.dart';
import 'dart:async';

class DataService {
  static Future<List<ShareInfoModel>?> fetchShareData() async {
    final response = await http.get(Uri.parse(URLConstants.BASE_URL));
    try {
      if (response.statusCode == 200) {
        final parsed =
            await json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<ShareInfoModel>((json) => ShareInfoModel.fromJson(json))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<NepseIndexModel?> getNepseIndex() async {
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

  static Future<List<TopGainersModel>?> getTopGainers() async {
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

  static Future<List<TopLosersModel>?> getTopLosers() async {
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
