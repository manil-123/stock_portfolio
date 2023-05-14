// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
// import 'package:share_portfolio/blocs/share_list_bloc/share_list_state.dart';
// import 'package:share_portfolio/model/share_info_list.dart';
// import 'package:share_portfolio/views/screens/portfolio/com/my_search_delegate.dart';
// import 'package:share_portfolio/views/widgets/share_info_widget.dart';
// import '../../blocs/share_list_bloc/share_list_event.dart';
// import '../../core/config/show_snack.dart';

// class ShareListScreen extends StatefulWidget {
//   const ShareListScreen({Key? key}) : super(key: key);

//   @override
//   State<ShareListScreen> createState() => _ShareListScreenState();
// }

// class _ShareListScreenState extends State<ShareListScreen> {
//   ShareListBloc? shareListBloc;

//   @override
//   void initState() {
//     super.initState();
//     shareListBloc = BlocProvider.of<ShareListBloc>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: BlocBuilder<ShareListBloc, ShareListState>(
//         builder: (context, state) {
//           if (state is ShareListLoading) {
//             return Center(
//                 child: CircularProgressIndicator(
//               color: Colors.white,
//             ));
//           } else if (state is ShareListLoaded) {
//             return RefreshIndicator(
//               onRefresh: () async {
//                 shareListBloc!.add(LoadShareList());
//               },
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: IconButton(
//                             onPressed: () async {
//                               if (state.shareList != null)
//                                 showSearch(
//                                     context: context,
//                                     delegate: MySearchDelegate(
//                                         shareInfoList: ShareInfoList(
//                                             shareInfoList: state.shareList)));
//                               else
//                                 ShowMessage(context,
//                                     message: "Unable to search right now",
//                                     backColor: Colors.red);
//                             },
//                             icon: Icon(
//                               Icons.search,
//                               color: Colors.white,
//                               size: 30,
//                             )),
//                       ),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: state.shareList!.length,
//                       itemBuilder: ((context, index) => ShareInfoWidget(
//                           companyName: state.shareList![index].companyName,
//                           symbol: state.shareList![index].symbol,
//                           ltp: state.shareList![index].ltp,
//                           change: state.shareList![index].change)),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else if (state is ShareListFailedToLoad) {
//             return Center(
//               child: SizedBox(child: Text('Failed to Load')),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
