import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_add_stocks/load_add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart';

@RoutePage()
class PortfolioWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const PortfolioWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoadPortfolioCubit>()..loadPortfolio(),
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
      ],
      child: this,
    );
  }
}
