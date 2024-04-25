import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

class PortfolioItemList extends StatelessWidget {
  const PortfolioItemList({
    super.key,
    required this.stockList,
  });

  final List<LocalStockDataModel> stockList;

  @override
  Widget build(BuildContext context) {
    return stockList.isEmpty
        ? const SizedBox(
            height: 16.0,
          )
        : Container(
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
                return PortfolioItem(
                  stockData: stockList[index],
                );
              },
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
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
          FutureBuilder<String?>(
            future: context
                .read<LoadPortfolioCubit>()
                .getCompanyPrice(stockData.scrip),
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
          ),
        ],
      ),
    );
  }
}
