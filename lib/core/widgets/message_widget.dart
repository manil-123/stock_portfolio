import 'package:flutter/material.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';

void showErrorInfo(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    _getErrorWidget(errorMessage),
  );
}

void showInfo(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    _getMessageWidget(message),
  );
}

SnackBar _getErrorWidget(String errorMessage) {
  return SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(
      errorMessage,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    ),
    backgroundColor: AppColors.red,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}

SnackBar _getMessageWidget(String message) {
  return SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}
