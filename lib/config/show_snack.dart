import 'package:flutter/material.dart';
import 'package:share_portfolio/config/size_config.dart';

class ShowMessage {
  final BuildContext context;
  final String message;
  final Color backColor;
  final Color textColor;
  final bool showIcon;
  final IconData iconData;

  ShowMessage(
    this.context, {
    required this.message,
    this.backColor = Colors.green,
    this.textColor = Colors.white,
    this.showIcon = false,
    this.iconData = Icons.info,
  }) {
    final size = Ssize(context);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 5,
        backgroundColor: backColor,
        content: Row(
          children: [
            showIcon
                ? Padding(
                    padding: EdgeInsets.only(right: size.getW(8.0)),
                    child:
                        Icon(iconData, size: size.getFs(20), color: textColor),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontSize: size.getFs(16), color: textColor),
              ),
            ),
          ],
        )));
  }
}
