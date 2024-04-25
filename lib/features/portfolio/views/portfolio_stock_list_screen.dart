import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/core/widgets/show_alert_dialog.dart';

class PortfolioStockListScreen extends StatefulWidget {
  const PortfolioStockListScreen({
    super.key,
  });

  @override
  State<PortfolioStockListScreen> createState() =>
      _PortfolioStockListScreenState();
}

class _PortfolioStockListScreenState extends State<PortfolioStockListScreen> {
  void _loadPortfolio() {
    context.read<LoadPortfolioStockListCubit>().loadStocksList();
  }

  @override
  void initState() {
    super.initState();
    _loadPortfolio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.portfolioStockList),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(
                const AddStocksRoute(),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
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
                    showInfo(context, AppStrings.stockDeletedSuccessfully);
                    _loadPortfolio();
                  },
                  failed: () {
                    showErrorInfo(context, AppStrings.failedToDeleteStock);
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<LoadPortfolioStockListCubit,
              LoadPortfolioStockListState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SpinKitPulsingGrid(
                  color: Colors.white,
                ),
                loaded: (localStockDataList) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: localStockDataList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onLongPress: () {
                            showDeleteAlert(
                              context,
                              localStockDataList[index],
                            );
                          },
                          child: _portfolioItem(localStockDataList[index]),
                        );
                      },
                    ),
                  );
                },
                failed: () => const Center(
                  child: SizedBox(
                    child: Text(AppStrings.failedToLoad),
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

  Widget _portfolioItem(LocalStockDataModel stockData) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
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
                  style: PortfolioTheme.textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                _buildStockInfo(stockData),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStockPrice(stockData),
              const SizedBox(height: 10),
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
            style: PortfolioTheme.textTheme.bodySmall!.copyWith(
              color: AppColors.grey,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Text(
            '${stockData.quantity} Shares, LTP: Error',
            style: PortfolioTheme.textTheme.bodySmall!.copyWith(
              color: AppColors.grey,
            ),
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
            style: PortfolioTheme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Text(
            ' Error',
            style: PortfolioTheme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
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
            style: PortfolioTheme.textTheme.titleSmall!.copyWith(
              color: snapshot.data! > 0.0 ? AppColors.green : AppColors.red,
              fontWeight: FontWeight.w500,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Text(
            ' Error',
            style: PortfolioTheme.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.w500),
          );
        }
      },
    );
  }

  Future<dynamic> showDeleteAlert(
      BuildContext context, LocalStockDataModel localStockData) {
    return showDialog(
      context: context,
      builder: (ctx) => ShowAlertDialog(
        title:
            'Do you want to remove "${localStockData.scrip}" from Portfolio?',
        onSuccess: () {
          getIt<DeleteStockCubit>().deleteStock(localStockData);
          Navigator.pop(ctx);
        },
        onCancel: () {
          Navigator.pop(ctx);
        },
      ),
    );
  }
}
