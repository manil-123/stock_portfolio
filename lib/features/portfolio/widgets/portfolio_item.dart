import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/core/extensions/int_extension.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/widgets/show_alert_dialog.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';

class PortfolioItemList extends StatelessWidget {
  const PortfolioItemList({
    super.key,
    required this.stockList,
  });

  final List<LocalStockDataModel> stockList;

  @override
  Widget build(BuildContext context) {
    return stockList.isEmpty
        ? 16.verticalSpace
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stockList.take(5).length,
                  itemBuilder: (context, index) {
                    return PortfolioItem(
                      stockData: stockList[index],
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(
                    const PortfolioStockListRoute(),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.whiteBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    AppStrings.viewAll,
                    style: PortfolioTheme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              )
            ],
          );
  }
}

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({
    super.key,
    required this.stockData,
  });

  final LocalStockDataModel stockData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '${stockData.scrip} ',
                      style: PortfolioTheme.textTheme.titleMedium,
                    ),
                    Text(
                      '(${stockData.sectorName})',
                      style: PortfolioTheme.textTheme.bodySmall,
                    )
                  ],
                ),
                10.verticalSpace,
                _buildStockInfo(stockData),
                10.verticalSpace,
                _buildStockPrice(stockData),
                10.verticalSpace,
                _buildStockDifference(stockData),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDeleteAlert(
                context,
                stockData,
              );
            },
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStockInfo(LocalStockDataModel stockData) {
    return FutureBuilder<String?>(
      future: getIt<LoadPortfolioCubit>().getCompanyPrice(stockData.scrip),
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
      future: getIt<LoadPortfolioCubit>().getCompanyPrice(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            'Total Investment:- Rs.${(stockData.quantity * double.parse(snapshot.data!)).toStringAsFixed(1)}',
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
      future: getIt<LoadPortfolioCubit>().getLTPDiff(stockData.scrip),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Text(
            'Total Profit/Loss:- Rs. ${(snapshot.data! * stockData.quantity).toStringAsFixed(1)}',
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
          context.read<DeleteStockCubit>().deleteStock(localStockData);
          Navigator.pop(ctx);
        },
        onCancel: () {
          Navigator.pop(ctx);
        },
      ),
    );
  }
}
