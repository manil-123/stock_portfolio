import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio/load_portfolio_cubit.dart';
import 'package:share_portfolio/features/watchlist/blocs/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/features/watchlist/blocs/load_watchlist/load_watchlist_cubit.dart';
import 'package:share_portfolio/features/watchlist/blocs/remove_from_watchlist/remove_from_watchlist_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/watchlist/models/watchlist_data_model.dart';
import 'package:share_portfolio/features/watchlist/widgets/watchlist_item.dart';
import 'package:share_portfolio/core/widgets/show_alert_dialog.dart';

@RoutePage()
class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myWatchlist),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<LoadWatchlistCubit>().loadWatchlist();
        },
        child: BlocBuilder<LoadWatchlistCubit, LoadWatchlistState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const SpinKitPulsingGrid(
                color: Colors.white,
              ),
              loaded: (watchlistDataList) {
                return MultiBlocListener(
                  listeners: [
                    BlocListener<AddToWatchlistCubit, AddToWatchlistState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          success: () {
                            context.read<LoadWatchlistCubit>().loadWatchlist();
                          },
                        );
                      },
                    ),
                    BlocListener<RemoveFromWatchlistCubit,
                        RemoveFromWatchlistState>(
                      listener: (context, removeFromWatchlistState) {
                        removeFromWatchlistState.whenOrNull(
                          success: () {
                            showInfo(
                                context, AppStrings.stocksRemovedFromWatchlist);
                            Future.delayed(Duration.zero, () {
                              context
                                  .read<LoadWatchlistCubit>()
                                  .loadWatchlist();
                              getIt<LoadPortfolioCubit>().loadPortfolio();
                            });
                          },
                          failed: (errorMessage) {
                            showErrorInfo(context, errorMessage);
                          },
                        );
                      },
                    ),
                  ],
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
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
                              return WatchlistItem(
                                watchlistDataModel: watchlistDataList[index],
                                onDeleteWatchlistItem: () {
                                  showDeleteAlert(
                                      context, watchlistDataList[index]);
                                },
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
      BuildContext context, WatchlistDataModel watchlistDataModel) {
    return showDialog(
      context: context,
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
