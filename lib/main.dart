import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/app/theme/theme_data.dart';
import 'package:share_portfolio/blocs/auth/auth_bloc.dart';
import 'package:share_portfolio/blocs/home/home_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart';
import 'package:share_portfolio/blocs/share_list/share_list_bloc.dart';
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/di/injection.dart';

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
              const ShareListEvent.loadShareList(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>()
            ..add(
              const HomeEvent.loadHome(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoadPortfolioCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoadPortfolioStockListCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoadAddStockCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddStockCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteStockCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddToWatchlistCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Stock Portfolio',
        debugShowCheckedModeBanner: false,
        theme: PortfolioTheme.appTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
