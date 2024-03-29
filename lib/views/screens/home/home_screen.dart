import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/blocs/home/home_bloc.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/model/home/nepse_price_series/nepse_time_series_data_response.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/views/screens/home/nepse_index_screen.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
          const HomeEvent.loadHome(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const SpinKitPulsingGrid(
              color: Colors.white,
            ),
            loaded: (nepseIndex, timeSeriesData, topGainers, topLosers) =>
                _homeLoaded(nepseIndex, timeSeriesData, topGainers, topLosers),
            failed: (failure) => Center(
              child: Text(
                failure.failureMessage,
                style: PortfolioTheme.textTheme.titleSmall,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _homeLoaded(
    NepseIndexModel nepseIndex,
    List<NepseTimeSeriesData> timeSeriesData,
    List<TopGainersModel> topGainers,
    List<TopLosersModel> topLosers,
  ) {
    final titleTheme = PortfolioTheme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(
              const HomeEvent.loadHome(),
            );
      },
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            NepseIndexScreen(
              timeSeriesData: timeSeriesData,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppStrings.topGainers,
              style: titleTheme,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: topGainers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.router.push(
                      StockDetailRoute(
                        companyName: topGainers[index].companyName,
                        symbol: topGainers[index].symbol,
                        ltp: topGainers[index].ltp,
                        change: topGainers[index].change,
                      ),
                    );
                  },
                  child: ShareInfoWidget(
                    companyName: topGainers[index].companyName,
                    symbol: topGainers[index].symbol,
                    ltp: topGainers[index].ltp,
                    change: topGainers[index].change,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppStrings.topLosers,
              style: titleTheme,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: topLosers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.router.push(
                      StockDetailRoute(
                        companyName: topLosers[index].companyName,
                        symbol: topLosers[index].symbol,
                        ltp: topLosers[index].ltp,
                        change: topLosers[index].change,
                      ),
                    );
                  },
                  child: ShareInfoWidget(
                    companyName: topLosers[index].companyName,
                    symbol: topLosers[index].symbol,
                    ltp: topLosers[index].ltp,
                    change: topLosers[index].change,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
