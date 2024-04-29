import 'package:flutter/material.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';

class PortfolioWatchlistHeading extends StatelessWidget {
  const PortfolioWatchlistHeading({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: PortfolioTheme.textTheme.titleLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: const Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
