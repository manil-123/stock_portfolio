import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';

class PortfolioWatchlistHeading extends StatelessWidget {
  const PortfolioWatchlistHeading({
    super.key,
    required this.isListEmpty,
    required this.title,
    required this.onViewAll,
  });

  final bool isListEmpty;
  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return isListEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 16, bottom: 8.0),
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
                  child: isListEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          AppStrings.viewAll,
                          style: PortfolioTheme.textTheme.bodyMedium,
                        ),
                )
              ],
            ),
          );
  }
}
