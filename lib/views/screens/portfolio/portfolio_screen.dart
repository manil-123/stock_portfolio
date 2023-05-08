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
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio();
        },
        child: BlocBuilder<LoadPortfolioCubit, LoadPortfolioState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
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
                        _portfolioItems(localStockDataList),
                        _watchlistHeading(watchlistDataList),
                        _watchlistItems(watchlistDataList),
                        const SizedBox(
                          height: 16.0,
                        )
                      ],
                    ),
                  ),
                );
              },
              failed: () => const Center(
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

  Widget _portfolioHeading(List<LocalStockDataModel> localStockDataList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Portfolio',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                : const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget _portfolioItems(List<LocalStockDataModel> stockList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
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
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: const EdgeInsets.only(right: 12.0),
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
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                '(${stockData.sectorName})',
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
          _buildStockInfo(stockData),
        ],
      ),
    );
  }

  Widget _watchlistHeading(List<WatchlistDataModel> watchlistDataList) {
    return watchlistDataList.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'My Watchlist',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(
                      const WatchlistRoute(),
                    );
                  },
                  child: watchlistDataList.isEmpty
                      ? const SizedBox.shrink()
                      : const Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                )
              ],
            ),
          );
  }

  Widget _watchlistItems(List<WatchlistDataModel> watchlist) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: watchlist.take(5).length,
        itemBuilder: (context, index) {
          return _watchlistItem(
            watchlist[index],
          );
        },
      ),
    );
  }

  Widget _watchlistItem(WatchlistDataModel watchlistDataModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: const EdgeInsets.only(right: 12.0),
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
                '${watchlistDataModel.scrip} ',
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                '(${watchlistDataModel.sectorName})',
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
          Text(
            watchlistDataModel.companyName.length > 30
                ? watchlistDataModel.companyName.substring(0, 30) + '...'
                : watchlistDataModel.companyName,
            style: const TextStyle(fontSize: 14.0),
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
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Text(
            '${stockData.quantity} Shares, LTP: Error',
            style: const TextStyle(color: Color(0xFF79787D), fontSize: 12.0),
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
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Do you want to delete?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      getIt<DeleteStockCubit>().deleteStock(localStockData);
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
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
