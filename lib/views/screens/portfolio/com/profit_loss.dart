import 'package:flutter/material.dart';
import 'package:share_portfolio/constants/style.dart';

class ProfitLoss extends StatelessWidget {
  final double? totalInvestment;
  final double? profitLossPercent;
  final double? dailyPL;
  const ProfitLoss(
      {Key? key, this.totalInvestment, this.profitLossPercent, this.dailyPL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total Investment',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Rs. $totalInvestment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      profitLossPercent!.isNaN
                          ? 'No profit/loss'
                          : (profitLossPercent! < 0
                              ? '${profitLossPercent!.toStringAsFixed(1)} % loss'
                              : '${profitLossPercent!.toStringAsFixed(1)} % profit'),
                      style: TextStyle(
                          color: profitLossPercent!.isNaN
                              ? Colors.white
                              : profitLossPercent! > 0
                                  ? greenColor
                                  : redColor,
                          fontSize: 14.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Daily Profit/Loss',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs. ${dailyPL!.toStringAsFixed(1).replaceAll(RegExp('-'), '')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: dailyPL! < 0 ? redColor : greenColor,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      dailyPL! > 0
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
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
