import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_event.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_event.dart';
import 'package:share_portfolio/data/local_stock_dao.dart';
import 'package:share_portfolio/data/share_info_dao.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';
import 'package:share_portfolio/repository/nepse_repo.dart';
import 'package:share_portfolio/views/screens/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShareListBloc(
            shareInfoListDAO: ShareInfoListDAO(),
            nepseRepo: NepseRepo(),
          )..add(
              LoadShareList(),
            ),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            nepseRepo: NepseRepo(),
          )..add(LoadHome()),
        ),
        BlocProvider(
            create: (context) => PortfolioBloc(
                  localStockListDAO: LocalStockListDAO(),
                  calculationRepo: CalculationRepo(
                    shareInfoListDAO: ShareInfoListDAO(),
                    localStockListDAO: LocalStockListDAO(),
                  ),
                )..add(LoadPortfolio())),
      ],
      child: MaterialApp(
        title: 'Stock Portfolio',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primaryColor: Color(0xFF252527),
          accentColor: Color(0xFF000000),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        // ignore: prefer_const_constructors
        home: NavigationScreen(),
      ),
    );
  }
}
