// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:share_portfolio/blocs/home_bloc/home_event.dart';
// import 'package:share_portfolio/blocs/home_bloc/home_state.dart';
// import '../../blocs/home_bloc/home_bloc.dart';
// import '../widgets/share_info_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   HomeBloc? _homeBloc;
//   @override
//   void initState() {
//     super.initState();
//     _homeBloc = BlocProvider.of<HomeBloc>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: ((context, state) {
//           if (state is HomeStateLoading) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.white),
//             );
//           } else if (state is HomeStateLoaded) {
//             return RefreshIndicator(
//               backgroundColor: Theme.of(context).colorScheme.secondary,
//               color: Colors.white,
//               onRefresh: () async {
//                 _homeBloc!.add(LoadHome());
//               },
//               child: ListView(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                     height: 90,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.secondary,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 12, top: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'NEPSE',
//                             style: TextStyle(
//                                 color: Color(0xFF79787D), fontSize: 18.0),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 30,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                   color: double.parse(state
//                                               .nepseIndex!.percentageChange!) >=
//                                           0
//                                       ? Color(0xFF0E3F1A)
//                                       : Color(0xFF661628),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 3),
//                                   child: Text(
//                                     state.nepseIndex!.index.toString(),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 18.0),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15.0,
//                               ),
//                               Container(
//                                 height: 30,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: double.parse(state
//                                               .nepseIndex!.percentageChange!) >=
//                                           0
//                                       ? Color(0xFF0E3F1A)
//                                       : Color(0xFF661628),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 3),
//                                   child: double.parse(state
//                                               .nepseIndex!.percentageChange!) >
//                                           0
//                                       ? Text(
//                                           '+${state.nepseIndex!.pointsChange}',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18.0),
//                                         )
//                                       : Text(
//                                           '-${state.nepseIndex!.pointsChange}',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18.0),
//                                         ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15.0,
//                               ),
//                               Container(
//                                 height: 30,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                   color: double.parse(state
//                                               .nepseIndex!.percentageChange!) >=
//                                           0
//                                       ? Color(0xFF0E3F1A)
//                                       : Color(0xFF661628),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 3),
//                                   child: double.parse(state
//                                               .nepseIndex!.percentageChange!) >
//                                           0
//                                       ? Text(
//                                           '+${state.nepseIndex!.percentageChange} %',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18.0),
//                                         )
//                                       : Text(
//                                           '-${state.nepseIndex!.percentageChange} %',
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18.0),
//                                         ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
//                     child: Text(
//                       'Top Gainers',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: state.topGainers!.length,
//                     itemBuilder: (context, index) {
//                       return ShareInfoWidget(
//                         companyName: state.topGainers![index].companyName,
//                         symbol: state.topGainers![index].symbol,
//                         ltp: state.topGainers![index].ltp,
//                         change: state.topGainers![index].change,
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
//                     child: Text(
//                       'Top Losers',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: state.topLosers!.length,
//                     itemBuilder: (context, index) {
//                       return ShareInfoWidget(
//                         companyName: state.topLosers![index].companyName,
//                         symbol: state.topLosers![index].symbol,
//                         ltp: state.topLosers![index].ltp,
//                         change: state.topLosers![index].change,
//                       );
//                     },
//                   )
//                 ],
//               ),
//             );
//           } else if (state is HomeStateFailedToLoad) {
//             return Center(
//               child: SizedBox(child: Text('Failed to Load')),
//             );
//           }
//           return Container();
//         }),
//       ),
//     );
//   }
// }
