import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/extensions/int_extension.dart';
import 'package:share_portfolio/core/state/generic_state.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/import_stock/import_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/features/portfolio/widgets/current_holdings.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_item.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_watchlist_heading.dart';
import 'package:share_portfolio/features/portfolio/widgets/profit_loss.dart';
import 'package:share_portfolio/features/portfolio/widgets/stock_addition_alert.dart';

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

            /// Reload portfolio while importing stocks from excel files
            BlocListener<ImportStockCubit, GenericState<ImportStockState>>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (_) {
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
                ) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
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
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return StockAdditionAlert(
                                      dialogContext: ctx,
                                    );
                                  },
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
                      12.verticalSpace,
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
