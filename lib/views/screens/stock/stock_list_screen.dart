import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/model/stock/share_info_list.dart';
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
          LoadShareList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: BlocBuilder<ShareListBloc, ShareListState>(
          builder: (context, state) {
            if (state is ShareListLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (state is ShareListLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ShareListBloc>().add(
                        LoadShareList(),
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
                                if (state.shareList.isNotEmpty)
                                  showSearch(
                                      context: context,
                                      delegate: MySearchDelegate(
                                          shareInfoList: ShareInfoList(
                                              shareInfoList: state.shareList)));
                                else
                                  showErrorInfo(
                                      context, "Unable to search right now");
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
                        itemCount: state.shareList.length,
                        itemBuilder: (context, index) => ShareInfoWidget(
                            companyName: state.shareList[index].companyName,
                            symbol: state.shareList[index].symbol,
                            ltp: state.shareList[index].ltp,
                            change: state.shareList[index].change),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ShareListFailedToLoad) {
              return Center(
                child: SizedBox(child: Text('Failed to Load')),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
