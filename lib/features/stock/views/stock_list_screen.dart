import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/stock/blocs/stock_list_bloc.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/features/stock/models/stock_info_list.dart';
import 'package:share_portfolio/features/stock/models/stock_info_model.dart';
import 'package:share_portfolio/features/portfolio/widgets/my_search_delegate.dart';
import 'package:share_portfolio/core/widgets/share_info_widget.dart';

@RoutePage()
class StockListScreen extends StatefulWidget {
  const StockListScreen({super.key});

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StockListBloc>().add(
          const StockListEvent.loadShareList(),
        );
  }

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
              loaded: (shareList) => _shareListLoaded(shareList),
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

  Widget _shareListLoaded(List<StockInfoModel> shareList) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<StockListBloc>().add(
              const StockListEvent.loadShareList(),
            );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () async {
                      if (shareList.isNotEmpty)
                        showSearch(
                            context: context,
                            delegate: MySearchDelegate(
                                shareInfoList:
                                    StockInfoList(shareInfoList: shareList)));
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
    );
  }
}
