import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/model/home/nepse_price_series/nepse_time_series_data_response.dart';

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
          child: LineChart(
            _lineChartData(),
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

  List<String> getBottomWidgets() {
    return ["1", "2", "3", "4"];
  }

  final List<Color> gradientColors = [
    AppColors.green.withOpacity(0.3),
    AppColors.green.withOpacity(0.2),
    AppColors.green.withOpacity(0.0),
  ];

  LineChartData _lineChartData() {
    /// maximum closing price within the [TimeSeriesData] list
    // final maxPrice = seriesData
    //     .reduce((maxData, data) => data.close > maxData.close ? data : maxData)
    //     .close;

    // /// minimum closing price within the [TimeSeriesData] list
    // final minPrice = seriesData
    //     .reduce((maxData, data) => data.close < maxData.close ? data : maxData)
    //     .close;

    // final hInterval = (maxPrice - minPrice) < 0.001
    //     ? (maxPrice - minPrice)
    //     : (maxPrice - minPrice) /
    //         ((selectedGraphOptions == ShareGraphOptions.fiveDay) ? 2 : 4);

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
        horizontalInterval: 100,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.green,
            strokeWidth: 1,
          );
        },
      ),

      /// set minY below 10% of minPrice
      minY: 0,

      /// set maxY above 10% of minPrice
      maxY: 3000,

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
                  color: AppColors.green, strokeWidth: 1.5, dashArray: [3, 5]);
              return const TouchedSpotIndicatorData(
                line,
                FlDotData(show: false),
              );
            },
          ).toList();
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: rightTitleWidgets,
            reservedSize: 42,
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
