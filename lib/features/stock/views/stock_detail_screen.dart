import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/watchlist/blocs/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/model/list_data_model.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/features/stock/components/line_titles.dart';
import 'package:share_portfolio/core/extensions/int_extension.dart';

@RoutePage()
class StockDetailScreen extends StatefulWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  final String change;
  final bool? showAddToWatchlist;

  const StockDetailScreen({
    super.key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
    this.showAddToWatchlist = true,
  });

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = PortfolioTheme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.symbol),
        centerTitle: true,
      ),
      body: BlocListener<AddToWatchlistCubit, AddToWatchlistState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              showInfo(context, "Stock added to watchlist successfully");
              Navigator.pop(context);
            },
            failed: (errorMessage) {
              showErrorInfo(context, errorMessage);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.companyName}(${widget.symbol})',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.white.withOpacity(0.6),
                  ),
                ),
                2.verticalSpace,
                Text(
                  '${AppStrings.sector} : ${getSector(widget.companyName)}',
                  style: textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: AppColors.white.withOpacity(0.6),
                  ),
                ),
                16.verticalSpace,
                _chartContainer(),
                16.verticalSpace,
                _moreInfo(AppStrings.lastTradedPrice, 'Rs. ${widget.ltp}'),
                _moreInfo(AppStrings.changePercent, '${widget.change} %'),
                40.verticalSpace,
                widget.showAddToWatchlist!
                    ? Center(
                        child: BlocBuilder<AddToWatchlistCubit,
                            AddToWatchlistState>(
                          builder: (context, addToWatchlistState) {
                            return ElevatedButton(
                              onPressed: () => _addToWatchlist(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                child: addToWatchlistState.maybeMap(
                                  loading: (value) => const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  orElse: () {
                                    return Text(AppStrings.addToWatchlist,
                                        style: PortfolioTheme
                                            .textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold));
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addToWatchlist() {
    BlocProvider.of<AddToWatchlistCubit>(context).addStockToWatchList(
      WatchlistDataModel(
        symbol: widget.symbol,
        companyName: widget.companyName,
        sectorName: getSector(widget.companyName),
      ),
    );
  }

  Widget _chartContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData(
            double.parse(widget.ltp.replaceAll(',', '')),
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Colors.white,
                strokeWidth: 0.2,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Colors.white,
                strokeWidth: 0.2,
              );
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, generateRandomStart()),
                FlSpot(generateRandomX(1.5), 2),
                FlSpot(generateRandomX(2.7), 3),
                FlSpot(generateRandomX(3.3), 4),
                FlSpot(generateRandomX(4.5), 2.5),
                FlSpot(generateRandomX(6.2), 4),
                const FlSpot(8, 3),
              ],
              isCurved: true,
              color: double.parse(widget.change.replaceAll(',', '')) >= 0
                  ? AppColors.green
                  : AppColors.red,
              barWidth: 2,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: double.parse(widget.change.replaceAll(',', '')) >= 0
                    ? AppColors.green.withOpacity(0.8)
                    : AppColors.red.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _moreInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: PortfolioTheme.textTheme.bodyMedium),
          Text(
            description,
            style: PortfolioTheme.textTheme.bodyMedium!.copyWith(
              color: double.parse(widget.change) == 0
                  ? Colors.white
                  : double.parse(widget.change) >= 0
                      ? AppColors.green
                      : AppColors.red,
            ),
          ),
        ],
      ),
    );
  }

  String getSector(String companyName) {
    return ListDataModel.companySectorData[companyName] ?? '---';
  }

  double generateRandomX(double n) {
    Random random = Random();
    double randomNumber = n + random.nextDouble();
    return randomNumber;
  }

  double generateRandomZeroToPointFive() {
    Random random = Random();
    double randomNumber = random.nextDouble() * 0.5;
    return randomNumber;
  }

  double generateRandomStart() {
    if (double.parse(widget.change) > 0) {
      final decimalNumber = double.parse(widget.change);
      final intValue = decimalNumber.toInt();
      switch (intValue) {
        case 0:
          return 3;
        case 1:
          return 2.4 + generateRandomZeroToPointFive();
        case 2:
          return 2.3 + generateRandomZeroToPointFive();
        case 3:
          return 2.1 + generateRandomZeroToPointFive();
        case 4:
          return 1.4 + generateRandomZeroToPointFive();
        case 5:
          return 1.2 + generateRandomZeroToPointFive();
        case 6:
          return 1 + generateRandomZeroToPointFive();
        case 7:
          return 0.6 + generateRandomZeroToPointFive();
        case 8:
          return 0.4 + generateRandomZeroToPointFive();
        case 9:
          return 0.1 + generateRandomZeroToPointFive();
        case 10:
          return 0;
        default:
          return 0;
      }
    } else {
      final decimalNumber = double.parse(widget.change.replaceAll('-', ''));
      final intValue = decimalNumber.toInt();
      switch (intValue) {
        case 0:
          return 3;
        case 1:
          return generateRandomX(3.1);
        case 2:
          return generateRandomX(3.5);
        case 3:
          return generateRandomX(3.7);
        case 4:
          return generateRandomX(4.1);
        case 5:
          return generateRandomX(4.5);
        case 6:
          return generateRandomX(4.7);
        case 7:
          return generateRandomX(5.1);
        case 8:
          return generateRandomX(5.5);
        case 9:
          return generateRandomX(5.7);
        case 10:
          return 6;
        default:
          return 0;
      }
    }
  }
}
