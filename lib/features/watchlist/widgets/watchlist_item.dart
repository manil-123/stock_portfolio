import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({
    super.key,
    required this.watchlistDataModel,
    required this.onDeleteWatchlistItem,
  });

  final WatchlistDataModel watchlistDataModel;
  final VoidCallback? onDeleteWatchlistItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ltp = await getIt<CalculationRepository>()
            .getLTP(watchlistDataModel.symbol);
        final change = await getIt<CalculationRepository>()
            .getChange(watchlistDataModel.symbol);
        context.router.push(
          StockDetailRoute(
              companyName: watchlistDataModel.companyName,
              symbol: watchlistDataModel.symbol,
              ltp: ltp,
              change: change,
              showAddToWatchlist: false),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        height: 70.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '${watchlistDataModel.symbol} ',
                      style: PortfolioTheme.textTheme.titleMedium,
                    ),
                    Text(
                      '(${watchlistDataModel.sectorName})',
                      style: PortfolioTheme.textTheme.bodySmall,
                    )
                  ],
                ),
                Text(
                  watchlistDataModel.companyName.length > 30
                      ? watchlistDataModel.companyName.substring(0, 30) + '...'
                      : watchlistDataModel.companyName,
                  style: PortfolioTheme.textTheme.bodySmall!.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            onDeleteWatchlistItem != null
                ? InkWell(
                    onTap: onDeleteWatchlistItem,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
