import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';

class StockAdditionAlert extends StatelessWidget {
  const StockAdditionAlert({
    super.key,
    required this.dialogContext,
  });

  final BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              dialogContext.router.maybePop();
              context.router.push(
                const AddStocksRoute(),
              );
            },
            child: const Text(AppStrings.addManually),
          ),
          TextButton(
            onPressed: () {
              dialogContext.router.maybePop();
              context.router.push(
                const ImportStocksRoute(),
              );
            },
            child: const Text(AppStrings.importExcelFiles),
          ),
        ],
      ),
    );
  }
}
