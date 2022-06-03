import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_state.dart';
import 'package:share_portfolio/views/widgets/share_info_widget.dart';
import '../../blocs/share_list_bloc/share_list_event.dart';

class ShareListScreen extends StatefulWidget {
  const ShareListScreen({Key? key}) : super(key: key);

  @override
  State<ShareListScreen> createState() => _ShareListScreenState();
}

class _ShareListScreenState extends State<ShareListScreen> {
  ShareListBloc? shareListBloc;

  @override
  void initState() {
    super.initState();
    shareListBloc = BlocProvider.of<ShareListBloc>(context);
    shareListBloc!.add(ShareListLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<ShareListBloc, ShareListState>(
        // bloc: _shareListBloc,
        builder: (context, state) {
          if (state is ShareListLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (state is ShareListLoaded)
            return ListView.builder(
              itemCount: state.shareList!.length,
              itemBuilder: ((context, index) => ShareInfoWidget(
                  companyName: state.shareList![index].companyName,
                  symbol: state.shareList![index].symbol,
                  ltp: state.shareList![index].ltp,
                  change: state.shareList![index].change)),
            );
          else if (state is ShareListFailedToLoad) {
            return Center(
              child: SizedBox(child: Text('Failed to Load')),
            );
          }
          return Container();
        },
      ),
    );
  }
}
