import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/home/blocs/home_bloc.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/features/home/models/nepse_price_series/nepse_time_series_data_response.dart';
import 'package:share_portfolio/features/home/models/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/core/model/nepse_index_model.dart';
import 'package:share_portfolio/features/home/models/top_losers/top_losers_model.dart';
import 'package:share_portfolio/features/home/views/nepse_index_screen.dart';
import 'package:share_portfolio/core/widgets/share_info_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                _homeLoaded(
              nepseIndex,
              timeSeriesData,
              topGainers,
              topLosers,
              context,
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
    );
  }

  Widget _homeLoaded(
    NepseIndexModel nepseIndex,
    List<NepseTimeSeriesData> timeSeriesData,
    List<TopGainersModel> topGainers,
    List<TopLosersModel> topLosers,
    BuildContext context,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(
              const HomeEvent.loadHome(),
            );
      },
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              children: [
                NepseIndexScreen(
                  timeSeriesData: timeSeriesData,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TopGainersList(
                        topGainers: topGainers,
                      ),
                    ),
                    Expanded(
                      child: TopLosersList(
                        topLosers: topLosers,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            children: [
              NepseIndexScreen(
                timeSeriesData: timeSeriesData,
              ),
              const SizedBox(
                height: 16,
              ),
              TopGainersList(
                topGainers: topGainers,
              ),
              TopLosersList(
                topLosers: topLosers,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class TopGainersList extends StatelessWidget {
  const TopGainersList({super.key, required this.topGainers});

  final List<TopGainersModel> topGainers;

  @override
  Widget build(BuildContext context) {
    final titleTheme = PortfolioTheme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    return Column(
      children: [
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
      ],
    );
  }
}

class TopLosersList extends StatelessWidget {
  const TopLosersList({
    super.key,
    required this.topLosers,
  });

  final List<TopLosersModel> topLosers;

  @override
  Widget build(BuildContext context) {
    final titleTheme = PortfolioTheme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    return Column(
      children: [
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
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
