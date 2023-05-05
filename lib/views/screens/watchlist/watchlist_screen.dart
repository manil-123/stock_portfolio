import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/remove_from_watchlist/remove_from_watchlist_cubit.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoadWatchlistCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<RemoveFromWatchlistCubit>(),
        ),
      ],
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
                return BlocListener<RemoveFromWatchlistCubit,
                    RemoveFromWatchlistState>(
                  listener: (context, removeFromWatchlistState) {
                    removeFromWatchlistState.whenOrNull(
                      success: () {
                        showInfo(context,
                            "Stock removed from watchlist successfully");
                        Future.delayed(Duration.zero, () {
                          _loadWatchlist();
                          getIt<LoadPortfolioCubit>().loadPortfolio();
                        });
                      },
                      failed: (errorMessage) {
                        showErrorInfo(context, errorMessage);
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: watchlistDataList.isEmpty
                        ? const Center(
                            child: Text('No stocks in the watchlist'),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: watchlistDataList.length,
                            itemBuilder: (context, index) {
                              return _watchlistItem(watchlistDataList[index]);
                            },
                          ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '${watchlistDataModel.symbol} ',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      '(${watchlistDataModel.sectorName})',
                      style: const TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  watchlistDataModel.companyName,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => showDeleteAlert(watchlistDataModel),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDeleteAlert(WatchlistDataModel watchlistDataModel) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: 280.0,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Do you want to remove "${watchlistDataModel.symbol}" from watchlist?',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      getIt<RemoveFromWatchlistCubit>()
                          .removeStockFromWatchList(watchlistDataModel);
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
