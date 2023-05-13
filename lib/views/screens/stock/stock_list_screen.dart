import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
import 'package:share_portfolio/model/stock/share_info_model.dart';
import 'package:share_portfolio/views/screens/portfolio/com/my_search_delegate.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';

class StockListScreen extends StatefulWidget {
  const StockListScreen({super.key});

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ShareListBloc>().add(
          ShareListEvent.loadShareList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: BlocBuilder<ShareListBloc, ShareListState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              loaded: (shareList) => _shareListLoaded(shareList),
              failed: () => Container(),
            );
          },
        ),
      ),
    );
  }

  Widget _shareListLoaded(List<ShareInfoModel> shareList) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ShareListBloc>().add(
              ShareListEvent.loadShareList(),
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
                                    ShareInfoList(shareInfoList: shareList)));
                      else
                        showErrorInfo(context, "Unable to search right now");
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: shareList.length,
              itemBuilder: (context, index) => ShareInfoWidget(
                  companyName: shareList[index].companyName,
                  symbol: shareList[index].symbol,
                  ltp: shareList[index].ltp,
                  change: shareList[index].change),
            ),
          ],
        ),
      ),
    );
  }
}
