import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/portfolio_item.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/profit_loss.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/watchlist_item.dart';

import 'widgets/welcome.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  StreamSubscription? _deleteStockStreamSubscription;
  StreamSubscription? _addStockStreamSubscription;
  StreamSubscription? _addToWatchlistStreamSubscription;

  @override
  void initState() {
    super.initState();
    _loadPortfolio();
    _listenForStockAddDeleteOperation();
    _listenForWatchlistAddOperation();
  }

  void _listenForStockAddDeleteOperation() async {
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

  void _listenForWatchlistAddOperation() async {
    _addToWatchlistStreamSubscription =
        getIt<AddToWatchlistCubit>().stream.listen((state) {
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
    if (_addToWatchlistStreamSubscription != null) {
      _addToWatchlistStreamSubscription!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio();
        },
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
                        _portfolioHeading(localStockDataList),
                        PortfolioItemList(
                          stockList: localStockDataList,
                        ),
                        _watchlistHeading(watchlistDataList),
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
    );
  }

  Widget _portfolioHeading(List<LocalStockDataModel> localStockDataList) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 16, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.portfolio,
            style: PortfolioTheme.textTheme.titleLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              localStockDataList.isEmpty
                  ? context.router.push(
                      const AddStocksRoute(),
                    )
                  : context.router.push(
                      const PortfolioListRouter(),
                    );
            },
            child: localStockDataList.isEmpty
                ? const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  )
                : Text(
                    AppStrings.viewAll,
                    style: PortfolioTheme.textTheme.bodyMedium,
                  ),
          )
        ],
      ),
    );
  }

  Widget _watchlistHeading(List<WatchlistDataModel> watchlistDataList) {
    return watchlistDataList.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 16, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.myWatchlist,
                  style: PortfolioTheme.textTheme.titleLarge!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(
                      const WatchlistRoute(),
                    );
                  },
                  child: watchlistDataList.isEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          'View All',
                          style: PortfolioTheme.textTheme.bodyMedium,
                        ),
                )
              ],
            ),
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
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.deleteQuestion,
                style: PortfolioTheme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      getIt<DeleteStockCubit>().deleteStock(localStockData);
                      Navigator.pop(context);
                    },
                    color: AppColors.black,
                    child: const Text(
                      AppStrings.yes,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.black,
                    child: const Text(
                      AppStrings.no,
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
