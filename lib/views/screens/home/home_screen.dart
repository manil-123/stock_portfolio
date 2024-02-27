import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/blocs/home/home_bloc.dart';
import 'package:share_portfolio/core/di/injection.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/services/scrapper.dart';
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
    getIt<Scrapper>().fetchNepsePriceHistory();
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
            loaded: (nepseIndex, topGainers, topLosers) =>
                _homeLoaded(nepseIndex, topGainers, topLosers),
            failed: (failure) => Center(
              child: Text(
                failure.failureMessage,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _homeLoaded(
    NepseIndexModel nepseIndex,
    List<TopGainersModel> topGainers,
    List<TopLosersModel> topLosers,
  ) {
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
            const NepseIndexScreen(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Top Gainers',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
            const Text(
              'Top Losers',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
