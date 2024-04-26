import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data_model.dart';

class PortfolioItemList extends StatelessWidget {
  const PortfolioItemList({
    super.key,
    required this.stockList,
  });

  final List<LocalStockDataModel> stockList;

  @override
  Widget build(BuildContext context) {
    return stockList.isEmpty
        ? SizedBox(
            height: 16.h,
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            height: 80.h,
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
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
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
