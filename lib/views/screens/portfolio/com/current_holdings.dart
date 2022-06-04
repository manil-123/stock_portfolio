import 'package:flutter/material.dart';
import '../../../../constants/style.dart';

class CurrentHoldings extends StatelessWidget {
  const CurrentHoldings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Your Current Holdings',
            style: greyTextStyle.copyWith(fontSize: 18.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rs.500000',
            style: whiteTextStyle.copyWith(fontSize: 30.0),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '500 kitta ko 2 company',
            style: whiteTextStyle.copyWith(fontSize: 18.0),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
