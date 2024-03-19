import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    required this.title,
    required this.onSuccess,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onSuccess;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: PortfolioTheme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: onSuccess,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    AppStrings.yes,
                    style: PortfolioTheme.textTheme.titleSmall,
                  ),
                ),
                MaterialButton(
                  onPressed: onCancel,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    AppStrings.no,
                    style: PortfolioTheme.textTheme.titleSmall,
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
