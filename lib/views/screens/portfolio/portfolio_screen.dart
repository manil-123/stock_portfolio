import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/views/screens/portfolio/components/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/components/profit_loss.dart';

import 'components/welcome.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  StreamSubscription? _deleteStockStreamSubscription;
  StreamSubscription? _addStockStreamSubscription;

  @override
  void initState() {
    super.initState();
    _loadPortfolio();
    _listenForAddDeleteOperation();
  }

  void _listenForAddDeleteOperation() async {
    _addStockStreamSubscription = getIt<AddStockCubit>().stream.listen((state) {
      state.whenOrNull(
        success: () {
          _loadPortfolio();
        },
      );
    });
    _deleteStockStreamSubscription =
        getIt<DeleteStockCubit>().stream.listen((state) {
      state.whenOrNull(
        success: () {
          _loadPortfolio();
        },
      );
    });
  }

  void _loadPortfolio() {
    context.read<LoadPortfolioCubit>().loadPortfolio();
  }

  @override
  void dispose() {
    super.dispose();
    if (_deleteStockStreamSubscription != null) {
      _deleteStockStreamSubscription!.cancel();
    }
    if (_addStockStreamSubscription != null) {
      _addStockStreamSubscription!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio();
        },
        child: BlocBuilder<LoadPortfolioCubit, LoadPortfolioState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              loaded: (
                totalInvestment,
                totalShares,
                totalStock,
                totalProfiLoss,
                currentValue,
                totalPLPercentage,
                totalDailyPL,
                localStockDataList,
              ) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Welcome(),
                        CurrentHoldings(
                          totalProfitLoss: totalProfiLoss,
                          currentValue: currentValue,
                          totalSharesCount: totalShares,
                          totalStockCount: totalStock,
                        ),
                        ProfitLoss(
                          totalInvestment: totalInvestment,
                          profitLossPercent: totalPLPercentage,
                          dailyProfitLoss: totalDailyPL,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Portfolio',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  context.router.push(
                                    PortfolioListRouter(),
                                  );
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        _portfolioItems(localStockDataList)
                      ],
                    ),
                  ),
                );
              },
              failed: () => Center(
                child: SizedBox(child: Text('Failed to Load')),
              ),
              orElse: () {
                return Container();
              },
            );
          },
        ),
      ),
    );
  }

  Widget _portfolioItems(List<LocalStockDataModel> stockList) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      padding: EdgeInsets.symmetric(vertical: 6.0),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: stockList.take(5).length,
        itemBuilder: (context, index) {
          return _portfolioItem(
            stockList[index],
          );
        },
      ),
    );
  }

  Widget _portfolioItem(LocalStockDataModel stockData) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                '${stockData.scrip} ',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '(${stockData.sectorName})',
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
          _buildStockInfo(stockData),
        ],
      ),
    );
  }

  Widget _buildStockInfo(LocalStockDataModel stockData) {
    return FutureBuilder<String>(
      future:
          context.read<LoadPortfolioCubit>().getCompanyPrice(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            '${stockData.quantity} Shares, LTP: ${snapshot.data}',
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
}
