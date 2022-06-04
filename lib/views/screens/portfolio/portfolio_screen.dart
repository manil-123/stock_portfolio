import 'package:flutter/material.dart';
import 'package:share_portfolio/config/size_config.dart';
import 'package:share_portfolio/constants/style.dart';
import 'package:share_portfolio/model/share_info_model.dart';
import 'package:share_portfolio/views/screens/portfolio/com/current_holdings.dart';
import 'package:share_portfolio/views/screens/portfolio/com/profit_loss.dart';
import 'package:share_portfolio/views/screens/portfolio/com/welcome.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';
import '../../../data/share_info_dao.dart';
import 'add_stocks.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ShareInfoListDAO _shareInfoListDAO = ShareInfoListDAO();
  List<ShareInfoModel>? shareInfoModelList;
  var loading = true;

  getData() async {
    var shareInfoList = await _shareInfoListDAO.getShareInfoList();
    shareInfoModelList = shareInfoList!.shareInfoList;
    load(false);
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddStocks(),
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
