import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_portfolio/config/size_config.dart';
import 'package:share_portfolio/data/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import 'package:share_portfolio/model/share_info_model.dart';
import 'package:share_portfolio/views/screens/portfolio/com/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/com/profit_loss.dart';
import 'package:share_portfolio/views/screens/portfolio/com/welcome.dart';
import '../../../data/share_info_dao.dart';
import 'add_stocks.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final LocalStockListDAO _localStockListDAO = LocalStockListDAO();
  final ShareInfoListDAO _shareInfoListDAO = ShareInfoListDAO();
  List<ShareInfoModel>? shareInfoModelList;
  List<LocalStockData>? localStockDataList;
  var loading = true;

  getData() async {
    localStockDataList = await _localStockListDAO.getLocalStockList();
    var shareInfoList = await _shareInfoListDAO.getShareInfoList();
    shareInfoModelList = shareInfoList!.shareInfoList!;
    Future.delayed(const Duration(milliseconds: 500), () {
      load(false);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  load(bool value) {
    if (mounted) {
      setState(() {
        loading = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = Ssize(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          Welcome(),
          CurrentHoldings(),
          ProfitLoss(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                    bool val = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddStocks(),
                      ),
                    );
                    if (val) {
                      load(true);
                      getData();
                    }
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
          loading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: localStockDataList!.length,
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
                                          _localStockListDAO.delete(
                                              localStockDataList![index]);
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Stock deleted successfully');
                                          Navigator.pop(context);
                                          load(true);
                                          getData();
                                        },
                                        color: Theme.of(context).accentColor,
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Theme.of(context).accentColor,
                                        child: Text(
                                          'No',
                                          style: TextStyle(color: Colors.white),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
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
                                    '${localStockDataList![index].scrip}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${localStockDataList![index].quantity} Shares, LTP: ${localStockDataList![index].price}',
                                    style: TextStyle(
                                        color: Color(0xFF79787D),
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rs. Total Value ${localStockDataList![index].price}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Profit/Loss',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

// loading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: shareInfoModelList!.length,
//                 itemBuilder: ((context, index) => ShareInfoWidget(
//                     companyName: shareInfoModelList![index].companyName,
//                     symbol: shareInfoModelList![index].symbol,
//                     ltp: shareInfoModelList![index].ltp,
//                     change: shareInfoModelList![index].change)),
//               ));
