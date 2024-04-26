import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/delete_stock/delete_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data_model.dart';
import 'package:share_portfolio/core/widgets/show_alert_dialog.dart';
import 'package:share_portfolio/features/portfolio/widgets/portfolio_item.dart';

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
          onPressed: () => context.router.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(
                const AddStocksRoute(),
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
          ],
          child: BlocBuilder<LoadPortfolioStockListCubit,
              LoadPortfolioStockListState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SpinKitPulsingGrid(
                  color: Colors.white,
                ),
                loaded: (localStockDataList) {
                  return SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: localStockDataList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onLongPress: () {
                            showDeleteAlert(
                              context,
                              localStockDataList[index],
                            );
                          },
                          child: PortfolioItem(
                            stockData: localStockDataList[index],
                          ),
                        );
                      },
                    ),
                  );
                },
                failed: () => const Center(
                  child: SizedBox(
                    child: Text(AppStrings.failedToLoad),
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

  Future<dynamic> showDeleteAlert(
      BuildContext context, LocalStockDataModel localStockData) {
    return showDialog(
      context: context,
      builder: (ctx) => ShowAlertDialog(
        title:
            'Do you want to remove "${localStockData.scrip}" from Portfolio?',
        onSuccess: () {
          getIt<DeleteStockCubit>().deleteStock(localStockData);
          Navigator.pop(ctx);
        },
        onCancel: () {
          Navigator.pop(ctx);
        },
      ),
    );
  }
}
