import 'package:flutter/material.dart';

class ScreenSizeChecker {
  static bool isDesktop(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    /// width <500 => Mobile
    /// width <1100 => Tablet
    /// width >1100 => Desktop
    /// Currently ignoring Tablet version
    return width > 1000;
  }
}
