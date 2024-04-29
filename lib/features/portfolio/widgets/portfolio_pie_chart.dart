import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_portfolio/core/extensions/int_extension.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/features/portfolio/models/pie_chart_data_model.dart';

class PortfolioPieChart extends HookWidget {
  const PortfolioPieChart({super.key, required this.pieChartDataList});

  final List<PieChartDataModel> pieChartDataList;

  @override
  Widget build(BuildContext context) {
    final touchedIndex = useState(-1);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex.value = -1;
                      return;
                    }
                    touchedIndex.value =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(touchedIndex.value),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: pieChartDataList.map((model) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: getPieChartColor(model.sectorName),
                    ),
                    8.horizontalSpace,
                    Flexible(
                      child: Text(
                        model.sectorName,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(int touchedIndex) {
    return List.generate(pieChartDataList.length, (index) {
      final isTouched = index == touchedIndex;
      const fontSize = 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: getPieChartColor(pieChartDataList[index].sectorName),
        value: pieChartDataList[index].value,
        title: isTouched
            ? pieChartDataList[index].sectorName
            : '${pieChartDataList[index].value.toStringAsFixed(0)}%',
        radius: radius,
        titleStyle: const TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          shadows: shadows,
        ),
      );
    });
  }

  Color getPieChartColor(String sectorName) {
    switch (sectorName.trim()) {
      case 'Corporate Debenture':
        return AppColors.color1;
      case 'Microfinance':
        return AppColors.grey;
      case 'Commercial Banks':
        return AppColors.red;
      case 'Non Life Insurance':
        return AppColors.graphGrey;
      case 'Hydro Power':
        return AppColors.darkRed;
      case 'Manufacturing And Processing':
        return AppColors.color2;
      case 'Life Insurance':
        return AppColors.color3;
      case 'Finance':
        return AppColors.yellow;
      case 'Investment':
        return AppColors.color4;
      case 'Mutual Fund':
        return AppColors.color5;
      case 'Development Banks':
        return AppColors.green;
      case 'Preferred Stock':
        return AppColors.color6;
      case 'Tradings':
        return AppColors.color7;
      case 'Others':
        return AppColors.color8;
      default:
        return AppColors.red;
    }
  }
}
