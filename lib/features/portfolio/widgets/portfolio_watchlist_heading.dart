import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
