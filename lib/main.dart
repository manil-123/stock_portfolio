import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/router/app_router.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/watchlist/blocs/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/di/injection.dart';

import 'features/auth/blocs/auth_bloc.dart';

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
            create: (context) => getIt<AuthBloc>(),
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
        ));
  }
}
