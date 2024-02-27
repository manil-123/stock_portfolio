import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Total Investment',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Rs. $totalInvestment",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      profitLossPercent == 0
                          ? 'No profit/loss'
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Profit/Loss',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs. ${dailyProfitLoss.toStringAsFixed(1).replaceAll(RegExp('-'), '')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                  const SizedBox(
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
