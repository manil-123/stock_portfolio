import 'dart:developer';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:share_portfolio/core/constants/constants.dart';

class Scrapper {
  static void scrapData() async {
    final url = Uri.parse(URLConstants.SCRAP_URL);
    final response = await http.get(url);
    final html = parse(response.body);
    final tradingData = html.querySelector('#live-trading')!;
    final tradingRow = tradingData.querySelectorAll('tr');
    for (var row in tradingRow) {
      final rowData = row.querySelectorAll('td');
      if (rowData.isNotEmpty) {
        log(rowData[0].text.toString());
        log(rowData[1].text.toString());
        log(rowData[2].text.toString());
        log(rowData[3].text.toString());
        log(rowData[4].text.toString());
        log(rowData[5].text.toString());
      }
    }
    final topGainersTable = html.querySelector('#gainers')!;
    final topGainersTableRow = topGainersTable.querySelectorAll('tr');
    log(topGainersTableRow.toString());
  }
}
