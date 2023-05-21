import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_state.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';
import 'package:share_portfolio/views/screens/portfolio/com/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/com/profit_loss.dart';

import 'com/welcome.dart';

class AutoPortfolioScreen extends StatefulWidget {
  const AutoPortfolioScreen({super.key});

  @override
  State<AutoPortfolioScreen> createState() => _AutoPortfolioScreenState();
}

class _AutoPortfolioScreenState extends State<AutoPortfolioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(
          LoadPortfolio(),
        );
  }

  Future<String?> getCompanyPrice(String? scrip) async {
    var ltp = await getIt<CalculationRepository>().getLTP(scrip);
    return ltp;
  }

  Future<double?> getLTPDiff(String? scrip) async {
    var value = await getIt<CalculationRepository>().getLTPDifference(scrip);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<PortfolioBloc>().add(
                LoadPortfolio(),
              );
        },
        child: BlocConsumer<PortfolioBloc, PortfolioState>(
          listener: (context, state) {
            log(
              state.toString(),
            );
          },
          builder: (context, state) {
            if (state is PortfolioLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is PortfolioFailedToLoad) {
              return Center(
                child: SizedBox(child: Text('Failed to Load')),
              );
            } else if (state is PortfolioLoaded) {
              return SafeArea(
                child: ListView(
                  children: [
                    Welcome(),
                    CurrentHoldings(
                      totalProfitLoss: state.totalProfiLoss,
                      currentValue: state.currentValue,
                      totalSharesCount: state.totalShares,
                      totalStockCount: state.totalStock,
                    ),
                    ProfitLoss(
                      totalInvestment: state.totalInvestment,
                      profitLossPercent: state.totalPLPercentage,
                      dailyProfitLoss: state.totalDailyPL,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Portfolio',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () async {
                              context.router.push(
                                AddStocksRoute(),
                              );
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    _portfolioItems(state.localStockDataList)
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _portfolioItems(List<LocalStockData> stockList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: stockList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onLongPress: () {
            showDialog(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              // _portfolioBloc!.add(DeleteStock(
                              //     localStockData:
                              //         state.localStockDataList![index]));
                              // Fluttertoast.showToast(
                              //     msg: 'Stock deleted successfully');
                              // Navigator.pop(context);
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
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
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
                        '${stockList[index].scrip}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<String?>(
                          future: getCompanyPrice(stockList[index].scrip),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done)
                              return Text(
                                '${stockList[index].quantity} Shares, LTP: ${snapshot.data}',
                                style: TextStyle(
                                    color: Color(0xFF79787D), fontSize: 12.0),
                              );
                            else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            return Text(
                                '${stockList[index].quantity} Shares, LTP: Error',
                                style: TextStyle(
                                    color: Color(0xFF79787D), fontSize: 12.0));
                          })),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<String?>(
                        future: getCompanyPrice(stockList![index].scrip),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Text(
                              'Rs.${stockList[index].quantity! * double.parse(snapshot.data!)}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            );
                          else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          return Text(
                            ' Error',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          );
                        })),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<double?>(
                        future: getLTPDiff(stockList[index].scrip),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Text(
                              'Rs. ${(snapshot.data! * stockList![index].quantity!).toStringAsFixed(1)}',
                              style: TextStyle(
                                  color: snapshot.data! > 0.0
                                      ? AppColors.greenColor
                                      : AppColors.redColor,
                                  fontSize: 14),
                            );
                          else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          return Text(
                            ' Error',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          );
                        })),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
