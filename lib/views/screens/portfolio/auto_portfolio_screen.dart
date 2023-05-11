import 'package:flutter/material.dart';
import 'package:share_portfolio/views/screens/portfolio/com/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/com/profit_loss.dart';

import 'com/welcome.dart';

class AutoPortfolioScreen extends StatefulWidget {
  const AutoPortfolioScreen({super.key});

  @override
  State<AutoPortfolioScreen> createState() => _AutoPortfolioScreenState();
}

class _AutoPortfolioScreenState extends State<AutoPortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          children: const [
            Welcome(),
            CurrentHoldings(
              totalProfitLoss: 1500,
              currentValue: 1500,
              totalSharesCount: 1500,
              totalStockCount: 1500,
            ),
            ProfitLoss(
              totalInvestment: 1800000,
              profitLossPercent: 15,
              dailyPL: 15000,
            ),
          ],
        ),
      ),
    );
  }
}
