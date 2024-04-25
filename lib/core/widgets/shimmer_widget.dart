import 'package:flutter/material.dart';

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    );
  }
}
