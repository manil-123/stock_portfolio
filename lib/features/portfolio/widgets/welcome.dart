import 'package:flutter/material.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome!',
          style: PortfolioTheme.textTheme.titleLarge!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        // CircleAvatar(
        //   radius: 26.0,
        //   backgroundImage: AssetImage('assets/images/user.png'),
        // ),
      ],
    );
  }
}
