import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/model/list_data_model.dart';

class StockDetailScreen extends StatefulWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  final String change;

  const StockDetailScreen({
    super.key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  });

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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.companyName}(${widget.symbol})',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              'Sector : ${getSector(widget.companyName)}',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Center(
                child: Text('Chart'),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            _moreInfo('Last Traded Price', 'Rs. ${widget.ltp}'),
            _moreInfo('Change', 'Rs. ${widget.change}'),
          ],
        ),
      ),
    );
  }

  Widget _moreInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: double.parse(widget.change) == 0
                  ? Colors.white
                  : double.parse(widget.change) > 0
                      ? AppColors.greenColor
                      : AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }

  String getSector(String companyName) {
    return ListDataModel.companySectorData[companyName] ?? 'No Data';
  }
}
