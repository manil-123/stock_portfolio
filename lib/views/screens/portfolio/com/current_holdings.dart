import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Your Current Holdings',
            style: greyTextStyle.copyWith(fontSize: 20.0),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Rs. $currentValue',
                  style: whiteTextStyle.copyWith(fontSize: 28.0),
                ),
              ),
              totalProfitLoss != 0.0
                  ? Row(
                      children: [
                        totalProfitLoss == 0
                            ? Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 20,
                              )
                            : totalProfitLoss > 0
                                ? Icon(
                                    Icons.arrow_upward,
                                    color: AppColors.greenColor,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.arrow_downward,
                                    color: AppColors.redColor,
                                    size: 20,
                                  ),
                        Text(
                          'Rs. ${totalProfitLoss.toString().replaceAll(RegExp('-'), '')}',
                          style: TextStyle(
                              color: totalProfitLoss == 0
                                  ? Colors.white
                                  : totalProfitLoss > 0
                                      ? AppColors.greenColor
                                      : AppColors.redColor,
                              fontSize: 16.0),
                        ),
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            totalStockCount == 1
                ? '$totalSharesCount shares of $totalStockCount company'
                : '$totalSharesCount shares of $totalStockCount companies',
            style: whiteTextStyle.copyWith(fontSize: 18.0),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
