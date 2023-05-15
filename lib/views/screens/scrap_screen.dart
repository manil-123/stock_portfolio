import 'package:flutter/material.dart';
import 'package:share_portfolio/services/scrapper.dart';

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
    Scrapper.scrapData();
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
