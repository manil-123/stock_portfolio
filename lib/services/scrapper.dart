import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';

@LazySingleton()
class Scrapper {
  Future<Map<String, dynamic>> fetchStockData() async {
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
    return {"list": tradingMapList};
  }
}
