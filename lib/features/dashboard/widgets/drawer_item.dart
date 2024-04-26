import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.name,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final IconData iconData;
  final bool isSelected;

  /// Handle drawer item changes
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        color: isSelected ? AppColors.white : Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: 50.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(4.r),
              child: Icon(
                iconData,
                size: 40,
                color: isSelected ? AppColors.primary : AppColors.white,
              ),
            ),
            Text(
              name,
              style: PortfolioTheme.textTheme.titleMedium!.copyWith(
                color: isSelected ? AppColors.primary : AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
