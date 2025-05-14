import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/error/exception.dart';

@LazySingleton()
class Scrapper {
  Future<Map<String, dynamic>> getNepseIndex() async {
    try {
      final url = Uri.parse(URLConstants.SCRAP_URL);
      final response = await http.get(
        url,
      );

      final html = parse(response.body);
      final sliderData = html.querySelector(' #index-slider')!;
      final sliderItems = sliderData.querySelectorAll('.list-item');
      return {};
    } on SocketException {
      throw const NoInternetException();
    } catch (e) {
      throw ScrapException(ErrorMsg.scrapError);
    }
  }

  Future<Map<String, dynamic>> fetchNepsePriceHistory() async {
    try {
      final url = Uri.parse(URLConstants.NEPSE_PRICE_HISTORY_URL);
      final response = await http.get(url);
      final html = parse(response.body);
      final historyData =
          html.querySelector("#ctl00_ContentPlaceHolder1_divData")!;
      final historyDataRow = historyData.querySelectorAll('tr');
      List<Map<String, dynamic>> historyDataMapList = [];
      for (var row in historyDataRow) {
        final rowData = row.querySelectorAll('td');
        Map<String, dynamic> individualMap = {};
        if (rowData.isNotEmpty) {
          individualMap['date'] = rowData[1].text.toString();
          individualMap['index'] = double.parse(
            rowData[2].text.toString().replaceAll(',', ''),
          );
          individualMap['pointChange'] = double.parse(
            rowData[3].text.toString().replaceAll('%', ''),
          );
          individualMap['percentageChange'] = double.parse(
            rowData[4].text.toString().replaceAll('%', ''),
          );
        }
        historyDataMapList.add(individualMap);
      }
      historyDataMapList.removeAt(0);

      return {
        "price_history": historyDataMapList,
      };
    } on SocketException {
      throw const NoInternetException();
    } catch (e) {
      throw ScrapException(ErrorMsg.scrapError);
    }
  }

  Future<Map<String, dynamic>> fetchStockData() async {
    try {
      final url = Uri.parse(URLConstants.SCRAP_URL);
      final response = await http.get(url);
      final html = parse(response.body);
      final tradingData = html.querySelector('#live-trading')!;
      final tradingRow = tradingData.querySelectorAll('tr');
      List<Map<String, dynamic>> tradingMapList = [];
      for (var row in tradingRow) {
        final rowData = row.querySelectorAll('td');
        Map<String, dynamic> individualMap = {};
        if (rowData.isNotEmpty) {
          final title = rowData[0]
              .querySelector('a')
              ?.attributes['title']
              ?.split('(')[1]
              .replaceAll(")", "");
          individualMap['companyName'] = title;
          individualMap['symbol'] = rowData[0].text.toString();
          individualMap['ltp'] = rowData[1].text.toString();
          individualMap['change'] = rowData[2].text.toString();
        }
        tradingMapList.add(individualMap);
      }
      tradingMapList.removeAt(0);
      return {
        "list": tradingMapList,
      };
    } on SocketException {
      throw const NoInternetException();
    } catch (e) {
      throw ScrapException(ErrorMsg.scrapError);
    }
  }

  Future<Map<String, dynamic>> fetchTopGainersData() async {
    try {
      final url = Uri.parse(URLConstants.SCRAP_URL);
      final response = await http.get(url);
      final html = parse(response.body);
      final topGainersData =
          html.querySelector('#ctl00_ContentPlaceHolder1_LiveGainers')!;
      final topGainersRow = topGainersData.querySelectorAll('tr');
      List<Map<String, dynamic>> topGainersMapList = [];
      for (var row in topGainersRow) {
        final rowData = row.querySelectorAll('td');
        Map<String, dynamic> individualMap = {};
        if (rowData.isNotEmpty) {
          final title = rowData[0]
              .querySelector('a')
              ?.attributes['title']
              ?.split('(')[1]
              .replaceAll(")", "");
          individualMap['companyName'] = title;
          individualMap['symbol'] = rowData[0].text.toString();
          individualMap['ltp'] = rowData[1].text.toString();
          individualMap['change'] = rowData[2].text.toString();
          individualMap['quantity'] = rowData[6].text.toString();
        }
        topGainersMapList.add(individualMap);
      }
      topGainersMapList.removeAt(0);
      return {
        "top_gainers": topGainersMapList,
      };
    } on SocketException {
      throw const NoInternetException();
    } catch (e) {
      throw ScrapException(ErrorMsg.scrapError);
    }
  }

  Future<Map<String, dynamic>> fetchTopLosersData() async {
    try {
      final url = Uri.parse(URLConstants.SCRAP_URL);
      final response = await http.get(url);
      final html = parse(response.body);
      final topLosersData =
          html.querySelector('#ctl00_ContentPlaceHolder1_LiveLosers')!;
      final topLosersRow = topLosersData.querySelectorAll('tr');
      List<Map<String, dynamic>> topLosersMapList = [];
      for (var row in topLosersRow) {
        final rowData = row.querySelectorAll('td');
        Map<String, dynamic> individualMap = {};
        if (rowData.isNotEmpty) {
          final title = rowData[0]
              .querySelector('a')
              ?.attributes['title']
              ?.split('(')[1]
              .replaceAll(")", "");
          individualMap['companyName'] = title;
          individualMap['symbol'] = rowData[0].text.toString();
          individualMap['ltp'] = rowData[1].text.toString();
          individualMap['change'] = rowData[2].text.toString();
          individualMap['quantity'] = rowData[6].text.toString();
        }
        topLosersMapList.add(individualMap);
      }
      topLosersMapList.removeAt(0);
      return {
        "top_losers": topLosersMapList,
      };
    } on SocketException {
      throw const NoInternetException();
    } catch (e) {
      throw ScrapException(ErrorMsg.scrapError);
    }
  }
}
