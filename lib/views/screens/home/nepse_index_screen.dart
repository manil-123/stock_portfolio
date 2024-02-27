import 'package:flutter/material.dart';
import 'package:share_portfolio/model/home/nepse_price_series/nepse_time_series_data_response.dart';

class NepseIndexScreen extends StatelessWidget {
  const NepseIndexScreen({Key? key, required this.timeSeriesData})
      : super(key: key);

  final List<NepseTimeSeriesData> timeSeriesData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'NEPSE',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildContainer("1854"),
              const SizedBox(width: 16.0),
              _buildContainer("-8.0"),
            ],
          ),
          Text(
            timeSeriesData.length.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String text) {
    final isPositive = double.parse(text) >= 0;
    final color =
        isPositive ? const Color(0xFF0E3F1A) : const Color(0xFF661628);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }
}
