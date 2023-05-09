import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/cubit/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/injection.dart';

class ShareInfoWidget extends StatelessWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  final String change;
  const ShareInfoWidget({
    Key? key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddToWatchlistCubit>(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          symbol,
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        Text(
                          companyName,
                          maxLines: 2,
                          style: TextStyle(
                              color: Color(0xFF79787D), fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ltp,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Container(
                        height: 32,
                        width: 80,
                        decoration: BoxDecoration(
                          color: double.parse(change) >= 0
                              ? Color(0xFF0E3F1A)
                              : Color(0xFF661628),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.change_history,
                                color: double.parse(change) >= 0
                                    ? Color(0xFF30D059)
                                    : Color(0xFFF73961),
                                size: 14,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '$change %',
                                style: TextStyle(
                                    color: double.parse(change) >= 0
                                        ? Color(0xFF30D059)
                                        : Color(0xFFF73961),
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF79787D),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Text(
                      'Add to watchlist',
                      style: TextStyle(
                        fontSize: 12.0,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
