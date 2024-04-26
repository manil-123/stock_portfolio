import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';

class PortfolioTheme {
  static TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
  );

  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: PortfolioTheme.textTheme.bodyMedium,
      iconTheme: const IconThemeData(color: AppColors.white),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      surfaceTintColor: AppColors.scaffoldBackgroundColor,
    ),
    textTheme: TextTheme(
      bodyLarge: PortfolioTheme.textTheme.bodyLarge,
      bodyMedium: PortfolioTheme.textTheme.bodyMedium,
      bodySmall: PortfolioTheme.textTheme.bodySmall,
    ).apply(bodyColor: Colors.white),
  );
}
