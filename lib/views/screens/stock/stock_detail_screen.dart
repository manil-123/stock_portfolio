import 'package:flutter/material.dart';

class StockDetailScreen extends StatefulWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  const StockDetailScreen(
      {super.key,
      required this.companyName,
      required this.symbol,
      required this.ltp});

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.symbol),
      ),
    );
  }
}
