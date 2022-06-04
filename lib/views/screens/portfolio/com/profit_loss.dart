import 'package:flutter/material.dart';

class ProfitLoss extends StatelessWidget {
  const ProfitLoss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total Profit/Loss',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rs.10000',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // height: 32,
                    // width: 90,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF0E3F1A),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 5),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.change_history,
                            color: Color(0xFF30D059),
                            size: 14,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '2.69%',
                            style: TextStyle(
                                color: Color(0xFF30D059), fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Daily Profit/Loss',
                    maxLines: 2,
                    style: TextStyle(color: Color(0xFF79787D), fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Rs.10000',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
