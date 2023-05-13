import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart';
import 'package:share_portfolio/blocs/home_bloc/home_event.dart';
import 'package:share_portfolio/blocs/home_bloc/home_state.dart';
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
          LoadHome(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeStateLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is HomeStateLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(
                      LoadHome(),
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
                      itemCount: state.topGainers!.length,
                      itemBuilder: (context, index) {
                        return ShareInfoWidget(
                          companyName: state.topGainers![index].companyName,
                          symbol: state.topGainers![index].symbol,
                          ltp: state.topGainers![index].ltp,
                          change: state.topGainers![index].change,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
