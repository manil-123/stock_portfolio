import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/watchlist/blocs/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/features/portfolio/widgets/current_holdings.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_item.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_watchlist_heading.dart';
import 'package:share_portfolio/features/portfolio/widgets/profit_loss.dart';
import 'package:share_portfolio/features/portfolio/widgets/watchlist_item.dart';

import '../widgets/welcome.dart';

@RoutePage()
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  void _loadPortfolio(BuildContext context) {
    context.read<LoadPortfolioCubit>().loadPortfolio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio(context);
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<AddStockCubit, AddStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio(context);
                  },
                );
              },
            ),
            BlocListener<DeleteStockCubit, DeleteStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio(context);
                  },
                );
              },
            ),
            BlocListener<AddToWatchlistCubit, AddToWatchlistState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio(context);
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
                  return ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop
                              ? const EdgeInsets.all(30.0)
                              : const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
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
                                          const PortfolioStockListRoute(),
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
                      ),
                    );
                  });
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
                        onTap: () => _loadPortfolio(context),
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
