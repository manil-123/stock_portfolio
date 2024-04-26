import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';

class CurrentHoldings extends StatelessWidget {
  final double totalProfitLoss;
  final double currentValue;
  final int totalSharesCount;
  final int totalStockCount;
  const CurrentHoldings(
      {Key? key,
      required this.totalProfitLoss,
      required this.currentValue,
      required this.totalSharesCount,
      required this.totalStockCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppStrings.currentHoldings,
            style:
                PortfolioTheme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
          ),
          8.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rs. ${currentValue.toStringAsFixed(1)}',
                  style: PortfolioTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: 28.sp),
                ),
              ),
              totalProfitLoss != 0.0
                  ? Row(
                      children: [
                        totalProfitLoss == 0
                            ? const Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 20,
                              )
                            : totalProfitLoss > 0
                                ? const Icon(
                                    Icons.arrow_upward,
                                    color: AppColors.green,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.arrow_downward,
                                    color: AppColors.red,
                                    size: 20,
                                  ),
                        Text(
                          'Rs. ${totalProfitLoss.toStringAsFixed(1).replaceAll(RegExp('-'), '')}',
                          style: TextStyle(
                              color: totalProfitLoss == 0
                                  ? Colors.white
                                  : totalProfitLoss > 0
                                      ? AppColors.green
                                      : AppColors.red,
                              fontSize: 16.0),
                        ),
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
          8.verticalSpace,
          Text(
            totalStockCount == 1
                ? '$totalSharesCount shares of $totalStockCount company'
                : '$totalSharesCount shares of $totalStockCount companies',
            style:
                PortfolioTheme.textTheme.bodyMedium!.copyWith(fontSize: 18.0),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
