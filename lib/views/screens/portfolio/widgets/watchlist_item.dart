import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

class WatchlistItemList extends StatelessWidget {
  const WatchlistItemList({
    super.key,
    required this.watchlist,
  });

  final List<WatchlistDataModel> watchlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: watchlist.take(5).length,
        itemBuilder: (context, index) {
          return WatchlistItem(
            watchlistDataModel: watchlist[index],
            onDeleteWatchlistItem: null,
          );
        },
      ),
    );
  }
}

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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
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
    );
  }
}
