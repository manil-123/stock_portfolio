import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/injection.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadWatchlistCubit>(),
      child: WatchlistContentScreen(),
    );
  }
}

class WatchlistContentScreen extends StatefulWidget {
  const WatchlistContentScreen({super.key});

  @override
  State<WatchlistContentScreen> createState() => _WatchlistContentScreenState();
}

class _WatchlistContentScreenState extends State<WatchlistContentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoadWatchlistCubit>().loadWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Watchlist'),
      ),
    );
  }
}
