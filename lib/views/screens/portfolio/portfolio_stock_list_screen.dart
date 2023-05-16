import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

class PortfolioStockListScreen extends StatefulWidget {
  final List<LocalStockDataModel> localStockDataList;

  const PortfolioStockListScreen({
    super.key,
    required this.localStockDataList,
  });

  @override
  State<PortfolioStockListScreen> createState() =>
      _PortfolioStockListScreenState();
}

class _PortfolioStockListScreenState extends State<PortfolioStockListScreen> {
  List<LocalStockDataModel> _localStockDataList = [];

  @override
  void initState() {
    super.initState();
    _localStockDataList = widget.localStockDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Portfolio Stock List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _localStockDataList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                showDeleteAlert(
                  context,
                  _localStockDataList[index],
                );
              },
              child: _portfolioItem(_localStockDataList[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _portfolioItem(LocalStockDataModel stockData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  stockData.scrip,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                SizedBox(height: 10),
                _buildStockInfo(stockData),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStockPrice(stockData),
              SizedBox(height: 10),
              _buildStockDifference(stockData),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStockInfo(LocalStockDataModel stockData) {
    return FutureBuilder<String?>(
      future:
          context.read<LoadPortfolioCubit>().getCompanyPrice(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            '${stockData.quantity} Shares, LTP: ${snapshot.data}',
            style: TextStyle(color: Color(0xFF79787D), fontSize: 12.0),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text(
            '${stockData.quantity} Shares, LTP: Error',
            style: TextStyle(color: Color(0xFF79787D), fontSize: 12.0),
          );
        }
      },
    );
  }

  Widget _buildStockPrice(LocalStockDataModel stockData) {
    return FutureBuilder<String?>(
      future:
          context.read<LoadPortfolioCubit>().getCompanyPrice(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            'Rs.${(stockData.quantity * double.parse(snapshot.data!)).toStringAsFixed(1)}',
            style: TextStyle(color: Colors.white, fontSize: 14),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text(
            ' Error',
            style: TextStyle(color: Colors.white, fontSize: 14),
          );
        }
      },
    );
  }

  Widget _buildStockDifference(LocalStockDataModel stockData) {
    return FutureBuilder<double?>(
      future: context.read<LoadPortfolioCubit>().getLTPDiff(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            'Rs. ${(snapshot.data! * stockData.quantity).toStringAsFixed(1)}',
            style: TextStyle(
              color: snapshot.data! > 0.0
                  ? AppColors.greenColor
                  : AppColors.redColor,
              fontSize: 14,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return Text(
            ' Error',
            style: TextStyle(color: Colors.white, fontSize: 14),
          );
        }
      },
    );
  }

  Future<dynamic> showDeleteAlert(
      BuildContext context, LocalStockDataModel localStockData) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: 280.0,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Do you want to delete?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _localStockDataList.remove(localStockData);
                      getIt<DeleteStockCubit>().deleteStock(localStockData);
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
