import 'package:flutter/material.dart';

class NepseIndexScreen extends StatelessWidget {
  const NepseIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
        ],
      ),
    );
  }

  Widget _buildContainer(String text) {
    final isPositive = double.parse(text) >= 0;
    final color =
        isPositive ? const Color(0xFF0E3F1A) : const Color(0xFF661628);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
