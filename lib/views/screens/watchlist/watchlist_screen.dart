import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadWatchlistCubit>(),
      child: const WatchlistContentScreen(),
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
    _loadWatchlist();
  }

  void _loadWatchlist() {
    context.read<LoadWatchlistCubit>().loadWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadWatchlist();
        },
        child: BlocBuilder<LoadWatchlistCubit, LoadWatchlistState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const SpinKitPulsingGrid(
                color: Colors.white,
              ),
              loaded: (watchlistDataList) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: watchlistDataList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          // showDeleteAlert(
                          //   context,
                          //   watchlistDataList[index],
                          // );
                        },
                        child: _watchlistItem(watchlistDataList[index]),
                      );
                    },
                  ),
                );
              },
              failed: (errorMessage) => Center(
                child: SizedBox(
                  child: Text(errorMessage),
                ),
              ),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }

  Widget _watchlistItem(WatchlistDataModel watchlistDataModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                '${watchlistDataModel.scrip} ',
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                '(${watchlistDataModel.sectorName})',
                style: const TextStyle(fontSize: 12.0),
              )
            ],
          ),
          Text(
            watchlistDataModel.companyName,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
