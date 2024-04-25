import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/features/home/models/nepse_price_series/nepse_time_series_data_response.dart';

const indicatorTextStyle = TextStyle(fontSize: 12);

class FlTimeSeriesChart extends StatelessWidget {
  FlTimeSeriesChart({
    super.key,
    required this.seriesData,
  });

  final List<NepseTimeSeriesData> seriesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: LineChart(
                  _lineChartData(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: getRightWidgets().map((element) {
                    return Text(
                      element,
                      style: indicatorTextStyle,
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getBottomWidgets().map((element) {
              return Text(
                element,
                style: indicatorTextStyle,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<String> getRightWidgets() {
    List<String> uniquePrices = [];

    /// maximum index within the [TimeSeriesData] list
    final maxPrice = seriesData
            .reduce((maxData, data) =>
                data.index! > maxData.index! ? data : maxData)
            .index ??
        0;

    /// minimum index within the [TimeSeriesData] list
    final minPrice = seriesData
            .reduce((maxData, data) =>
                data.index! < maxData.index! ? data : maxData)
            .index ??
        0;

    /// set minY below 1% of minPrice
    final minY =
        double.parse((minPrice - (minPrice * 0.01)).toStringAsFixed(0));

    /// set maxY above 1% of minPrice
    final maxY =
        double.parse((maxPrice + (maxPrice * 0.01)).toStringAsFixed(0));

    final difference = (maxY - minY) / 3;

    uniquePrices.add(minY.toStringAsFixed(0));
    uniquePrices.add((minY + difference).toStringAsFixed(0));
    uniquePrices.add((maxY - difference).toStringAsFixed(0));
    uniquePrices.add(maxY.toStringAsFixed(0));
    return uniquePrices.reversed.toList();
  }

  List<String> getBottomWidgets() {
    final uniqueDates = seriesData
        .map((data) => DateFormat.MMM()
            .format(DateTime.parse(data.date!.replaceAll('/', '-'))))
        .toSet()
        .toList();
    return uniqueDates;
  }

  final List<Color> gradientColors = [
    AppColors.green.withOpacity(0.3),
    AppColors.green.withOpacity(0.2),
    AppColors.green.withOpacity(0.0),
  ];

  LineChartData _lineChartData() {
    // maximum index within the [TimeSeriesData] list
    final maxPrice = seriesData
            .reduce((maxData, data) =>
                data.index! > maxData.index! ? data : maxData)
            .index ??
        0;

    // minimum index within the [TimeSeriesData] list
    final minPrice = seriesData
            .reduce((maxData, data) =>
                data.index! < maxData.index! ? data : maxData)
            .index ??
        0;

    /// set minY below 1% of minPrice
    final minY =
        double.parse((minPrice - (minPrice * 0.01)).toStringAsFixed(0));

    /// set maxY above 1% of minPrice
    final maxY =
        double.parse((maxPrice + (maxPrice * 0.01)).toStringAsFixed(0));

    // Extracting timestamps and close values from seriesData
    List<FlSpot> spots = seriesData.map((data) {
      return FlSpot(
        seriesData.indexOf(data).toDouble(),
        data.index ?? 0,
      );
    }).toList();
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 50,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.graphGrey,
            strokeWidth: 0.2,
          );
        },
      ),

      /// set minY below 10% of minPrice
      minY: minY,

      /// set maxY above 10% of minPrice
      maxY: maxY,

      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          /// Workaround to not show the touchTooltip
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return null;
            }).toList();
          },
        ),
        touchCallback: (p0, p1) {
          if (p1 != null && p1.lineBarSpots != null) {
          } else {}
        },
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> indicators) {
          return indicators.map(
            (int index) {
              const line = FlLine(
                color: AppColors.yellow,
                strokeWidth: 1.5,
                dashArray: [3, 5],
              );
              return const TouchedSpotIndicatorData(
                line,
                FlDotData(show: false),
              );
            },
          ).toList();
        },
      ),
      titlesData: const FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          barWidth: 2,
          isStrokeCapRound: false,
          gradient: const LinearGradient(
            colors: [AppColors.green, AppColors.green],
          ),
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
        ),
      ],
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '$value',
        style: indicatorTextStyle,
        textAlign: TextAlign.left,
      ),
    );
  }
}
