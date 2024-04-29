import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget get verticalSpace {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get horizontalSpace {
    return SizedBox(
      width: toDouble(),
    );
  }
}
