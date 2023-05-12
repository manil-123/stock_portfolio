import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart';
import 'package:share_portfolio/model/home/top_gainers/top_gainers_model.dart';
import 'package:share_portfolio/model/nepse_index_model.dart';
import 'package:share_portfolio/model/home/top_losers/top_losers_model.dart';
import 'package:share_portfolio/views/screens/home/nepse_index_screen.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';

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
          HomeEvent.loadHome(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => Center(
              child: CircularProgressIndicator(color: Colors.white),
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
              HomeEvent.loadHome(),
            );
      },
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            NepseIndexScreen(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Top Gainers',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: topGainers.length,
              itemBuilder: (context, index) {
                return ShareInfoWidget(
                  companyName: topGainers[index].companyName,
                  symbol: topGainers[index].symbol,
                  ltp: topGainers[index].ltp,
                  change: topGainers[index].change,
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Top Losers',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: topLosers.length,
              itemBuilder: (context, index) {
                return ShareInfoWidget(
                  companyName: topLosers[index].companyName,
                  symbol: topLosers[index].symbol,
                  ltp: topLosers[index].ltp,
                  change: topLosers[index].change,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
