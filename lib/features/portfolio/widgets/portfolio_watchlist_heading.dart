import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';

class PortfolioWatchlistHeading extends StatelessWidget {
  const PortfolioWatchlistHeading({
    super.key,
    required this.isListEmpty,
    required this.title,
    required this.onViewAll,
    this.isPortfolio = false,
  });

  final bool isListEmpty;
  final String title;
  final VoidCallback onViewAll;
  final bool isPortfolio;

  @override
  Widget build(BuildContext context) {
    if (isListEmpty && !isPortfolio) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: PortfolioTheme.textTheme.titleLarge!
                .copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: isListEmpty
                ? isPortfolio
                    ? const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      )
                    : const SizedBox.shrink()
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
