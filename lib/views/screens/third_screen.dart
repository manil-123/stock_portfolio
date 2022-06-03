import 'package:flutter/material.dart';
import 'package:share_portfolio/model/share_info_list.dart';
import 'package:share_portfolio/model/share_info_model.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';
import '../../config/connect.dart';
import '../../data/share_info_dao.dart';
import '../../handler/data_service.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: shareInfoModelList!.length,
                itemBuilder: ((context, index) => ShareInfoWidget(
                    companyName: shareInfoModelList![index].companyName,
                    symbol: shareInfoModelList![index].symbol,
                    ltp: shareInfoModelList![index].ltp,
                    change: shareInfoModelList![index].change)),
              ));
  }
}
