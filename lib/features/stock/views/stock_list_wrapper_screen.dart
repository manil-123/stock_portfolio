import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/stock/blocs/stock_list_bloc.dart';

@RoutePage()
class StockListWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const StockListWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StockListBloc>()
        ..add(
          const StockListEvent.loadShareList(),
        ),
      child: this,
    );
  }
}
