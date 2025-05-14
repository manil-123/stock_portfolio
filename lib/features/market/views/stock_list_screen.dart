import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/core/utils/screen_size_checker.dart';
import 'package:share_portfolio/features/market/blocs/stock_list_bloc.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/features/market/models/stock_info_list.dart';
import 'package:share_portfolio/features/market/models/stock_info_model.dart';
import 'package:share_portfolio/features/portfolio/widgets/my_search_delegate.dart';
import 'package:share_portfolio/core/widgets/share_info_widget.dart';

@RoutePage()
class StockListScreen extends StatelessWidget {
  const StockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: BlocBuilder<StockListBloc, StockListState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => const SpinKitPulsingGrid(
                color: Colors.white,
              ),
              loaded: (shareList) => _ShareListLoaded(
                shareList: shareList,
              ),
              failed: (failure) => Center(
                child: Text(
                  failure.failureMessage,
                  style: PortfolioTheme.textTheme.titleSmall,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ShareListLoaded extends StatelessWidget {
  const _ShareListLoaded({
    required this.shareList,
  });

  final List<StockInfoModel> shareList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<StockListBloc>().add(
              const StockListEvent.loadShareList(),
            );
      },
      backgroundColor: AppColors.primary,
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: ScreenSizeChecker.isDesktop(context)
              ? const EdgeInsets.symmetric(horizontal: 32, vertical: 32)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                      onPressed: () async {
                        if (shareList.isNotEmpty)
                          showSearch(
                            context: context,
                            delegate: MySearchDelegate(
                              shareInfoList:
                                  StockInfoList(shareInfoList: shareList),
                            ),
                          );
                        else
                          showErrorInfo(
                            context,
                            AppStrings.unableToSearch,
                          );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: shareList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.router.push(
                      StockDetailRoute(
                        companyName: shareList[index].companyName,
                        symbol: shareList[index].symbol,
                        ltp: shareList[index].ltp,
                        change: shareList[index].change,
                      ),
                    );
                  },
                  child: ShareInfoWidget(
                      companyName: shareList[index].companyName,
                      symbol: shareList[index].symbol,
                      ltp: shareList[index].ltp,
                      change: shareList[index].change),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
