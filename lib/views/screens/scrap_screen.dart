import 'dart:developer';

import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    getNepseData();
  }

  Future<void> getNepseData() async {
    final url = Uri.parse("https://merolagani.com/LatestMarket.aspx");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final tradingData = html.querySelectorAll('live-trading');
    log(tradingData.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrap Screen')),
    );
  }
}
