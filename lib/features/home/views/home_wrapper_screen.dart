import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/home/blocs/home_bloc.dart';

@RoutePage()
class HomeWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const HomeWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(
          const HomeEvent.loadHome(),
        ),
      child: this,
    );
  }
}
