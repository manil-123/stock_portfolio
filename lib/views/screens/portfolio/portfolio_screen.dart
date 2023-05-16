import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_event.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_state.dart';
import 'package:share_portfolio/constants/style.dart';
import 'package:share_portfolio/data/local_stock_dao.dart';
import 'package:share_portfolio/model/share_info_model.dart';
import 'package:share_portfolio/repository/calculation_repo.dart';
import 'package:share_portfolio/views/screens/portfolio/com/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/com/profit_loss.dart';
import 'package:share_portfolio/views/screens/portfolio/com/welcome.dart';
import '../../../blocs/share_list_bloc/share_list_bloc.dart';
import '../../../blocs/share_list_bloc/share_list_event.dart';
import '../../../config/connect.dart';
import '../../../data/share_info_dao.dart';
import 'add_stocks.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  PortfolioBloc? _portfolioBloc;
  ShareListBloc? _shareListBloc;
  final LocalStockListDAO? _localStockListDAO = LocalStockListDAO();
  final ShareInfoListDAO _shareInfoListDAO = ShareInfoListDAO();
  List<ShareInfoModel>? shareInfoModelList;

  getData() async {
    _shareListBloc = BlocProvider.of<ShareListBloc>(context);
    _portfolioBloc = BlocProvider.of<PortfolioBloc>(context);
    if (await Connect.isConnected(context)) {
      _shareListBloc!.add(LoadShareList());
    }
    var shareInfoList = await _shareInfoListDAO.getShareInfoList();
    shareInfoModelList = shareInfoList!.shareInfoList!;
  }

  Future<String?> getCompanyPrice(String? scrip) async {
    var ltp = await CalculationRepo(
            shareInfoListDAO: _shareInfoListDAO,
            localStockListDAO: _localStockListDAO)
        .getLTP(scrip);
    return ltp;
  }

  Future<double?> getLTPDiff(String? scrip) async {
    var value = await CalculationRepo(
            shareInfoListDAO: _shareInfoListDAO,
            localStockListDAO: _localStockListDAO)
        .getLTPDifference(scrip);
    return value;
  }

  @override
  void initState() {
    super.initState();
    getData();
    _portfolioBloc!.add(LoadPortfolio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        color: Colors.white,
        onRefresh: () async {
          _portfolioBloc!.add(LoadPortfolio());
        },
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: ((context, state) {
            if (state is PortfolioLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is PortfolioLoaded) {
              return ListView(
                children: [
                  Welcome(),
                  CurrentHoldings(
                    totalProfitLoss: state.totalProfiLoss,
                    currentValue: state.currentValue,
                    totalSharesCount: state.totalShares,
                    totalStockCount: state.totalStock,
                  ),
                  ProfitLoss(
                    totalInvestment: state.totalInvestment,
                    profitLossPercent: state.totalPLPercentage,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Portfolio',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddStocks(
                                  portfolioBloc: _portfolioBloc,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.localStockDataList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                width: 280.0,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Do you want to delete?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            _portfolioBloc!.add(DeleteStock(
                                                localStockData:
                                                    state.localStockDataList![
                                                        index]));
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Stock deleted successfully');
                                            Navigator.pop(context);
                                          },
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          child: Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 14),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${state.localStockDataList![index].scrip}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FutureBuilder<String?>(
                                        future: getCompanyPrice(state
                                            .localStockDataList![index].scrip),
                                        builder: ((context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done)
                                            return Text(
                                              '${state.localStockDataList![index].quantity} Shares, LTP: ${snapshot.data}',
                                              style: TextStyle(
                                                  color: Color(0xFF79787D),
                                                  fontSize: 12.0),
                                            );
                                          else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          }
                                          return Text(
                                              '${state.localStockDataList![index].quantity} Shares, LTP: Error',
                                              style: TextStyle(
                                                  color: Color(0xFF79787D),
                                                  fontSize: 12.0));
                                        })),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FutureBuilder<String?>(
                                      future: getCompanyPrice(state
                                          .localStockDataList![index].scrip),
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done)
                                          return Text(
                                            'Rs.${state.localStockDataList![index].quantity! * double.parse(snapshot.data!)}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          );
                                        else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }
                                        return Text(
                                          ' Error',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        );
                                      })),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder<double?>(
                                      future: getLTPDiff(state
                                          .localStockDataList![index].scrip),
                                      builder: ((context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done)
                                          return Text(
                                            'Rs. ${(snapshot.data! * state.localStockDataList![index].quantity!).toStringAsFixed(1)}',
                                            style: TextStyle(
                                                color: snapshot.data! > 0.0
                                                    ? greenColor
                                                    : redColor,
                                                fontSize: 14),
                                          );
                                        else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }
                                        return Text(
                                          ' Error',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        );
                                      })),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (state is PortfolioFailedToLoad) {
              return Center(
                child: SizedBox(child: Text('Failed to Load')),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
