import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/portfolio_item.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/portfolio_watchlist_heading.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/profit_loss.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/watchlist_item.dart';

import 'widgets/welcome.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    super.initState();
    _loadPortfolio();
  }

  void _loadPortfolio() {
    context.read<LoadPortfolioCubit>().loadPortfolio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio();
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<AddStockCubit, AddStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio();
                  },
                );
              },
            ),
            BlocListener<DeleteStockCubit, DeleteStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio();
                  },
                );
              },
            ),
            BlocListener<AddToWatchlistCubit, AddToWatchlistState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio();
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<LoadPortfolioCubit, LoadPortfolioState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SpinKitPulsingGrid(
                  color: Colors.white,
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
                  watchlistDataList,
                ) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Welcome(),
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
                          PortfolioWatchlistHeading(
                            isListEmpty: localStockDataList.isEmpty,
                            isPortfolio: true,
                            title: AppStrings.portfolio,
                            onViewAll: () {
                              localStockDataList.isEmpty
                                  ? context.router.push(
                                      const AddStocksRoute(),
                                    )
                                  : context.router.push(
                                      const PortfolioListRouter(),
                                    );
                            },
                          ),
                          PortfolioItemList(
                            stockList: localStockDataList,
                          ),
                          PortfolioWatchlistHeading(
                            isListEmpty: watchlistDataList.isEmpty,
                            title: AppStrings.myWatchlist,
                            onViewAll: () {
                              context.router.push(
                                const WatchlistRoute(),
                              );
                            },
                          ),
                          WatchlistItemList(
                            watchlist: watchlistDataList,
                          ),
                          const SizedBox(
                            height: 16.0,
                          )
                        ],
                      ),
                    ),
                  );
                },
                failed: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.failedToLoad),
                      const SizedBox(
                        height: 12.0,
                      ),
                      InkWell(
                        onTap: () => _loadPortfolio(),
                        child: const Text(
                          AppStrings.tapToLoad,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                orElse: () {
                  return Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
