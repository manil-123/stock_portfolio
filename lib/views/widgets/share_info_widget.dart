import 'package:flutter/material.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';

class ShareInfoWidget extends StatelessWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  final String change;
  const ShareInfoWidget({
    Key? key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PortfolioTheme.textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    symbol,
                    style: theme.titleMedium,
                  ),
                  Text(
                    companyName,
                    maxLines: 2,
                    style: theme.bodySmall!.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  double.parse(ltp.replaceAll(',', ''))
                      .toStringAsFixed(1)
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.titleMedium,
                ),
                Container(
                  height: 32,
                  width: 80,
                  decoration: BoxDecoration(
                    color: double.parse(change) >= 0
                        ? const Color(0xFF0E3F1A)
                        : const Color(0xFF661628),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.change_history,
                          color: double.parse(change) >= 0
                              ? const Color(0xFF30D059)
                              : const Color(0xFFF73961),
                          size: 14,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${double.parse(change).toStringAsFixed(1)} %',
                          style: theme.bodySmall!.copyWith(
                              color: double.parse(change) >= 0
                                  ? const Color(0xFF30D059)
                                  : const Color(0xFFF73961),
                              fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
