import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_state.dart';
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
}
