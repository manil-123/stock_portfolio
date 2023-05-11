import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/app/database/share_info_dao.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ShareListBloc>()
            ..add(
              ShareListEvent.loadShareList(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>()
            ..add(
              HomeEvent.loadHome(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
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
      child: MaterialApp.router(
        title: 'Stock Portfolio',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
