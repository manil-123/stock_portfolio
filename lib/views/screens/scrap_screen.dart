import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class ScrapScreen extends StatefulWidget {
  const ScrapScreen({super.key});

  @override
  State<ScrapScreen> createState() => _ScrapScreenState();
}

class _ScrapScreenState extends State<ScrapScreen> {
  @override
  void initState() {
    super.initState();
    getNepseData();
  }

  Future<void> getNepseData() async {
    final url = Uri.parse("https://merolagani.com/LatestMarket.aspx");
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
      }
    }
    final topGainersTable = html.querySelector('#gainers')!;
    final topGainersTableRow = topGainersTable.querySelectorAll('tr');
    log(topGainersTableRow.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: ElevatedButton(
          onPressed: () => getNepseData(),
          child: Text('Get Data'),
        ),
      ),
    );
  }
}
