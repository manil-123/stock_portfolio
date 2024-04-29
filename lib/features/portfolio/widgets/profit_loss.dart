import 'package:flutter/material.dart';
import 'package:share_portfolio/core/extensions/int_extension.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';

class ProfitLoss extends StatelessWidget {
  final double totalInvestment;
  final double profitLossPercent;
  final double dailyProfitLoss;
  const ProfitLoss({
    Key? key,
    required this.totalInvestment,
    required this.profitLossPercent,
    required this.dailyProfitLoss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = PortfolioTheme.textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.totalInvestment,
                    maxLines: 2,
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    "Rs. $totalInvestment",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge,
                  ),
                  8.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      profitLossPercent == 0
                          ? AppStrings.noProfitLoss
                          : (profitLossPercent < 0
                              ? '${profitLossPercent.toStringAsFixed(1)} % loss'
                              : '${profitLossPercent.toStringAsFixed(1)} % profit'),
                      style: TextStyle(
                        color: profitLossPercent == 0
                            ? Colors.white
                            : profitLossPercent > 0
                                ? AppColors.green
                                : AppColors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.dailyProfitLoss,
                    maxLines: 2,
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Rs. ${dailyProfitLoss.toStringAsFixed(1).replaceAll(RegExp('-'), '')}',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge!.copyWith(
                            color: dailyProfitLoss == 0
                                ? Colors.white
                                : dailyProfitLoss < 0
                                    ? AppColors.red
                                    : AppColors.green,
                            fontSize: 20.0),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      dailyProfitLoss == 0
                          ? const Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 20,
                            )
                          : dailyProfitLoss > 0
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
                    ],
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
