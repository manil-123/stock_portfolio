import 'package:flutter/material.dart';
import '../../../../constants/style.dart';

class CurrentHoldings extends StatelessWidget {
  final double? totalProfitLoss;
  final double? currentValue;
  final int? totalSharesCount;
  final int? totalStockCount;
  const CurrentHoldings(
      {Key? key,
      this.totalProfitLoss,
      this.currentValue,
      this.totalSharesCount,
      this.totalStockCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
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
              Row(
                children: [
                  totalProfitLoss! > 0
                      ? Icon(
                          Icons.arrow_upward,
                          color: greenColor,
                          size: 20,
                        )
                      : Icon(
                          Icons.arrow_downward,
                          color: redColor,
                          size: 20,
                        ),
                  Text(
                    'Rs. ${totalProfitLoss!.toString().replaceAll(RegExp('-'), '')}',
                    style: TextStyle(
                        color: totalProfitLoss! > 0 ? greenColor : redColor,
                        fontSize: 16.0),
                  ),
                ],
              )
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
