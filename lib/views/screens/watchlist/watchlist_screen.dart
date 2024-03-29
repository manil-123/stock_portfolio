import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/blocs/watchlist/remove_from_watchlist/remove_from_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';
import 'package:share_portfolio/views/screens/portfolio/widgets/watchlist_item.dart';
import 'package:share_portfolio/views/widgets/show_alert_dialog.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadWatchlistCubit>(
          create: (_) => getIt<LoadWatchlistCubit>(),
        ),
        BlocProvider<RemoveFromWatchlistCubit>(
          create: (_) => getIt<RemoveFromWatchlistCubit>(),
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
        title: const Text(AppStrings.myWatchlist),
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
                        showInfo(
                            context, AppStrings.stocksRemovedFromWatchlist);
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
                            child: Text(AppStrings.noStocksInWatchlist),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: watchlistDataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: WatchlistItem(
                                  watchlistDataModel: watchlistDataList[index],
                                  onDeleteWatchlistItem: () {
                                    showDeleteAlert(
                                        context, watchlistDataList[index]);
                                  },
                                ),
                              );
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

  Future<dynamic> showDeleteAlert(
      BuildContext ctx, WatchlistDataModel watchlistDataModel) {
    return showDialog(
      context: ctx,
      builder: (ctx) => ShowAlertDialog(
          title:
              'Do you want to remove "${watchlistDataModel.symbol}" from watchlist?',
          onSuccess: () {
            BlocProvider.of<RemoveFromWatchlistCubit>(context)
                .removeStockFromWatchList(watchlistDataModel);
            Navigator.pop(ctx);
          },
          onCancel: () {
            Navigator.pop(ctx);
          }),
    );
  }
}
