// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i13;

import '../../splash_screen.dart' as _i1;
import '../../views/screens/auth/auth_screen.dart' as _i2;
import '../../views/screens/dashboard/dashboard_screen.dart' as _i3;
import '../../views/screens/home/home_screen.dart' as _i5;
import '../../views/screens/portfolio/add_stocks_screen.dart' as _i9;
import '../../views/screens/portfolio/portfolio_screen.dart' as _i8;
import '../../views/screens/portfolio/portfolio_stock_list_screen.dart' as _i11;
import '../../views/screens/stock/stock_detail_screen.dart' as _i6;
import '../../views/screens/stock/stock_list_screen.dart' as _i7;
import '../../views/screens/watchlist/watchlist_screen.dart' as _i10;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    StockListRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
        maintainState: false,
      );
    },
    PortfolioRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    StockDetailRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.StockDetailScreen(
          key: args.key,
          companyName: args.companyName,
          symbol: args.symbol,
          ltp: args.ltp,
          change: args.change,
        ),
      );
    },
    StockListRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.StockListScreen(),
      );
    },
    PortfolioRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.PortfolioScreen(),
      );
    },
    PortfolioListRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    AddStocksRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AddStocksScreen(),
      );
    },
    WatchlistRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.WatchlistScreen(),
      );
    },
    PortfolioStockListRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.PortfolioStockListScreen(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          AuthRoute.name,
          path: '/authScreen',
        ),
        _i12.RouteConfig(
          DashboardRoute.name,
          path: '/dashboardScreen',
          children: [
            _i12.RouteConfig(
              HomeRouter.name,
              path: 'homeScreen',
              parent: DashboardRoute.name,
              children: [
                _i12.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i12.RouteConfig(
                  StockDetailRoute.name,
                  path: 'stockDetailScreen',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              StockListRouter.name,
              path: 'stockListScreen',
              parent: DashboardRoute.name,
              children: [
                _i12.RouteConfig(
                  StockListRoute.name,
                  path: '',
                  parent: StockListRouter.name,
                ),
                _i12.RouteConfig(
                  StockDetailRoute.name,
                  path: 'stockDetailScreen',
                  parent: StockListRouter.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              PortfolioRouter.name,
              path: 'portfolioScreen',
              parent: DashboardRoute.name,
              children: [
                _i12.RouteConfig(
                  PortfolioRoute.name,
                  path: '',
                  parent: PortfolioRouter.name,
                ),
                _i12.RouteConfig(
                  PortfolioListRouter.name,
                  path: 'portfolioStockListScreen',
                  parent: PortfolioRouter.name,
                  children: [
                    _i12.RouteConfig(
                      PortfolioStockListRoute.name,
                      path: '',
                      parent: PortfolioListRouter.name,
                    ),
                    _i12.RouteConfig(
                      AddStocksRoute.name,
                      path: 'addStocksScreen',
                      parent: PortfolioListRouter.name,
                    ),
                  ],
                ),
                _i12.RouteConfig(
                  AddStocksRoute.name,
                  path: 'addStocksScreen',
                  parent: PortfolioRouter.name,
                ),
                _i12.RouteConfig(
                  WatchlistRoute.name,
                  path: 'watchlistScreen',
                  parent: PortfolioRouter.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/authScreen',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboardScreen',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i12.PageRouteInfo<void> {
  const HomeRouter({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'homeScreen',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class StockListRouter extends _i12.PageRouteInfo<void> {
  const StockListRouter({List<_i12.PageRouteInfo>? children})
      : super(
          StockListRouter.name,
          path: 'stockListScreen',
          initialChildren: children,
        );

  static const String name = 'StockListRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class PortfolioRouter extends _i12.PageRouteInfo<void> {
  const PortfolioRouter({List<_i12.PageRouteInfo>? children})
      : super(
          PortfolioRouter.name,
          path: 'portfolioScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioRouter';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.StockDetailScreen]
class StockDetailRoute extends _i12.PageRouteInfo<StockDetailRouteArgs> {
  StockDetailRoute({
    _i13.Key? key,
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
  }) : super(
          StockDetailRoute.name,
          path: 'stockDetailScreen',
          args: StockDetailRouteArgs(
            key: key,
            companyName: companyName,
            symbol: symbol,
            ltp: ltp,
            change: change,
          ),
        );

  static const String name = 'StockDetailRoute';
}

class StockDetailRouteArgs {
  const StockDetailRouteArgs({
    this.key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  });

  final _i13.Key? key;

  final String companyName;

  final String symbol;

  final String ltp;

  final String change;

  @override
  String toString() {
    return 'StockDetailRouteArgs{key: $key, companyName: $companyName, symbol: $symbol, ltp: $ltp, change: $change}';
  }
}

/// generated route for
/// [_i7.StockListScreen]
class StockListRoute extends _i12.PageRouteInfo<void> {
  const StockListRoute()
      : super(
          StockListRoute.name,
          path: '',
        );

  static const String name = 'StockListRoute';
}

/// generated route for
/// [_i8.PortfolioScreen]
class PortfolioRoute extends _i12.PageRouteInfo<void> {
  const PortfolioRoute()
      : super(
          PortfolioRoute.name,
          path: '',
        );

  static const String name = 'PortfolioRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class PortfolioListRouter extends _i12.PageRouteInfo<void> {
  const PortfolioListRouter({List<_i12.PageRouteInfo>? children})
      : super(
          PortfolioListRouter.name,
          path: 'portfolioStockListScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioListRouter';
}

/// generated route for
/// [_i9.AddStocksScreen]
class AddStocksRoute extends _i12.PageRouteInfo<void> {
  const AddStocksRoute()
      : super(
          AddStocksRoute.name,
          path: 'addStocksScreen',
        );

  static const String name = 'AddStocksRoute';
}

/// generated route for
/// [_i10.WatchlistScreen]
class WatchlistRoute extends _i12.PageRouteInfo<void> {
  const WatchlistRoute()
      : super(
          WatchlistRoute.name,
          path: 'watchlistScreen',
        );

  static const String name = 'WatchlistRoute';
}

/// generated route for
/// [_i11.PortfolioStockListScreen]
class PortfolioStockListRoute extends _i12.PageRouteInfo<void> {
  const PortfolioStockListRoute()
      : super(
          PortfolioStockListRoute.name,
          path: '',
        );

  static const String name = 'PortfolioStockListRoute';
}
