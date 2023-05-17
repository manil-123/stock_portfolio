import 'package:flutter/material.dart';

const double mySHeight = 740.0;
const double mySWidth = 360.0;

class Ssize {
  final BuildContext context;

  Ssize(this.context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }

  double? _width;
  double? _height;

  double get width => _width!;
  double get height => _height!;

  double getH(double h) {
    return h * _height! / mySHeight;
  }

  double getW(double w) {
    return w * _width! / mySWidth;
  }

  double getFs(double fs) {
    return fs * (_height! + _width!) / (mySHeight + mySWidth);
  }

  bool isIpad() {
    return _width! > 600;
  }
}
