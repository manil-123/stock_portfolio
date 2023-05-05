import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData(double price) {
    return FlTitlesData(
      show: true,
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (meta.formattedValue) {
              case '0':
                return Text(
                  '11',
                  style: _getTextStyle(),
                );
              case '1':
                return const Text('');
              case '2':
                return Text(
                  '12',
                  style: _getTextStyle(),
                );
              case '3':
                return const Text('');
              case '4':
                return Text(
                  '1',
                  style: _getTextStyle(),
                );
              case '5':
                return const Text('');
              case '6':
                return Text(
                  '2',
                  style: _getTextStyle(),
                );
              case '7':
                return const Text('');
              case '8':
                return Text(
                  '3',
                  style: _getTextStyle(),
                );
              default:
                return const Text('');
            }
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (meta.formattedValue) {
              case '0':
                return Text(
                  (price - price * 0.1).toStringAsFixed(0),
                  style: _getTextStyle(),
                );
              case '1':
                return const Text('');
              case '2':
                return const Text('');
              case '3':
                return Text(
                  price.toStringAsFixed(0),
                  style: _getTextStyle(),
                );
              case '4':
                return const Text('');
              case '5':
                return const Text('');
              case '6':
                return Text(
                  (price + price * 0.1).toStringAsFixed(0),
                  style: _getTextStyle(),
                );
              default:
                return const Text('');
            }
          },
        ),
      ),
    );
  }

  static TextStyle _getTextStyle() {
    return const TextStyle(fontSize: 10.0);
  }
}
