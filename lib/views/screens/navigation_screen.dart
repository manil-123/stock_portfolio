import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart';
import 'package:share_portfolio/blocs/share_list_bloc/share_list_event.dart';
import 'package:share_portfolio/views/screens/home_screen.dart';
import 'package:share_portfolio/views/screens/share_list_screen.dart';
import 'package:share_portfolio/views/screens/third_screen.dart';
import '../../config/connect.dart';
import '../../config/show_snack.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  ShareListBloc? _shareListBloc;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ShareListScreen(),
    ThirdScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  getData() async {
    _shareListBloc = BlocProvider.of<ShareListBloc>(context);
    _connectionStatus = await Connect.checkConnection();
    if (await Connect.isConnected(context)) {
      _shareListBloc!.add(ShareListLoad());
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
    if (_connectionStatus == ConnectivityResult.none)
      ShowMessage(context,
          message: "No internet connection",
          backColor: Colors.red,
          textColor: Colors.white,
          showIcon: true);
  }

  @override
  void initState() {
    super.initState();
    getData();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('HomeScreen'),
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(
              Icons.add,
            ),
            label: 'Stock Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Portfolio',
          ),
        ],
      ),
    );
  }
}
