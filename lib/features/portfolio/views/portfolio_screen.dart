import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
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
                              title: AppStrings.portfolio,
                              onViewAll: () {
                                context.router.push(
                                  const AddStocksRoute(),
                                );
                              },
                            ),
                            PortfolioItemList(
                              stockList: localStockDataList,
                            ),
                            16.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  );
                },
                failed: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.failedToLoad),
                      SizedBox(
                        height: 12.h,
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
