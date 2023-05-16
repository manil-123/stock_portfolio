// // ignore_for_file: curly_braces_in_flow_control_structures
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'show_snack.dart';

// class Connect {
//   static Connectivity connectivity = Connectivity();
//   static Future<ConnectivityResult> checkConnection() async {
//     try {
//       return await connectivity.checkConnectivity();
//     } catch (e) {
//       // print('Couldn\'t check connectivity status $e');
//       return ConnectivityResult.none;
//     }
//   }

//   static void onChanged(Function(ConnectivityResult)? onData) {
//     connectivity.onConnectivityChanged.listen(onData);
//   }

//   static Future<bool> isConnected(BuildContext context,
//       {bool showMsg = true}) async {
//     var connection = await checkConnection();
//     if (connection != ConnectivityResult.none)
//       return true;
//     else {
//       if (showMsg)
//         ShowMessage(context,
//             message: "No internet connection",
//             backColor: Colors.red,
//             textColor: Colors.white,
//             showIcon: true);
//       return false;
//     }
//   }
// }
