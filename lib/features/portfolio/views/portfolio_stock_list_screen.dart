import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/state/generic_state.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/import_stock/import_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/widgets/show_alert_dialog.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_pie_chart.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_item.dart';
import 'package:share_portfolio/features/portfolio/widgets/stock_addition_alert.dart';

@RoutePage()
class PortfolioStockListScreen extends StatefulWidget {
  const PortfolioStockListScreen({
    super.key,
  });

  @override
  State<PortfolioStockListScreen> createState() =>
      _PortfolioStockListScreenState();
}

class _PortfolioStockListScreenState extends State<PortfolioStockListScreen> {
  void _loadPortfolio() {
    context.read<LoadPortfolioStockListCubit>().loadStocksList();
  }

  @override
  void initState() {
    super.initState();
    _loadPortfolio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.portfolioStockList),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.maybePop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll(context);
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return StockAdditionAlert(
                    dialogContext: ctx,
                  );
                },
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadPortfolio();
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<AddStockCubit, AddStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    _loadPortfolio();
                  },
                );
              },
            ),
            BlocListener<DeleteStockCubit, DeleteStockState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    showInfo(context, AppStrings.stockDeletedSuccessfully);
                    _loadPortfolio();
                  },
                  failed: () {
                    showErrorInfo(context, AppStrings.failedToDeleteStock);
                  },
                );
              },
            ),

            /// Reload portfolio while importing stocks from excel files
            BlocListener<ImportStockCubit, GenericState<ImportStockState>>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (_) {
                    _loadPortfolio();
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<LoadPortfolioStockListCubit,
              GenericState<LoadPortfolioStockListState>>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SpinKitPulsingGrid(
                  color: Colors.white,
                ),
                success: (loadedState) {
                  return (loadedState.pieChartDataList.isEmpty &&
                          loadedState.localStockDataList.isEmpty)
                      ? const Center(
                          child: Text(
                            AppStrings.portfolioEmpty,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              PortfolioPieChart(
                                pieChartDataList: loadedState.pieChartDataList,
                              ),
                              ListView.builder(
                                itemCount:
                                    loadedState.localStockDataList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                                itemBuilder: (context, index) {
                                  return PortfolioItem(
                                    stockData:
                                        loadedState.localStockDataList[index],
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                },
                error: (errorMsg) => Center(
                  child: SizedBox(
                    child: Text(errorMsg),
                  ),
                ),
                orElse: () {
                  return Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> deleteAll(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (ctx) => ShowAlertDialog(
        title: AppStrings.removeAllStocks,
        onSuccess: () {
          context.read<DeleteStockCubit>().deleteAllStocks();
          Navigator.pop(ctx);
        },
        onCancel: () {
          Navigator.pop(ctx);
        },
      ),
    );
  }
}
