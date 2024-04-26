import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/watchlist/blocs/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/features/watchlist/blocs/remove_from_watchlist/remove_from_watchlist_cubit.dart';

@RoutePage()
class WatchlistWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const WatchlistWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadWatchlistCubit>(
          create: (_) => getIt<LoadWatchlistCubit>()..loadWatchlist(),
        ),
        BlocProvider<RemoveFromWatchlistCubit>(
          create: (_) => getIt<RemoveFromWatchlistCubit>(),
        ),
      ],
      child: this,
    );
  }
}
