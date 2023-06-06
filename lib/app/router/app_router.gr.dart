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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i12;

import '../../splash_screen.dart' as _i1;
import '../../views/screens/auth/auth_screen.dart' as _i2;
import '../../views/screens/dashboard/dashboard_screen.dart' as _i3;
import '../../views/screens/home/home_screen.dart' as _i6;
import '../../views/screens/portfolio/add_stocks_screen.dart' as _i9;
import '../../views/screens/portfolio/portfolio_screen.dart' as _i8;
import '../../views/screens/portfolio/portfolio_stock_list_screen.dart' as _i10;
import '../../views/screens/stock/stock_detail_screen.dart' as _i7;
import '../../views/screens/stock/stock_list_screen.dart' as _i5;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    StockListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StockListScreen(),
      );
    },
    PortfolioRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    StockDetailRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.StockDetailScreen(
          key: args.key,
          companyName: args.companyName,
          symbol: args.symbol,
          ltp: args.ltp,
        ),
      );
    },
    PortfolioRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.PortfolioScreen(),
      );
    },
    PortfolioListRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    AddStocksRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AddStocksScreen(),
      );
    },
    PortfolioStockListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.PortfolioStockListScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          AuthRoute.name,
          path: '/authScreen',
        ),
        _i11.RouteConfig(
          DashboardRoute.name,
          path: '/dashboardScreen',
          children: [
            _i11.RouteConfig(
              HomeRouter.name,
              path: 'homeScreen',
              parent: DashboardRoute.name,
              children: [
                _i11.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i11.RouteConfig(
                  StockDetailRoute.name,
                  path: 'stockDetailScreen',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              StockListRoute.name,
              path: 'stockListScreen',
              parent: DashboardRoute.name,
            ),
            _i11.RouteConfig(
              PortfolioRouter.name,
              path: 'portfolioScreen',
              parent: DashboardRoute.name,
              children: [
                _i11.RouteConfig(
                  PortfolioRoute.name,
                  path: '',
                  parent: PortfolioRouter.name,
                ),
                _i11.RouteConfig(
                  PortfolioListRouter.name,
                  path: 'portfolioStockListScreen',
                  parent: PortfolioRouter.name,
                  children: [
                    _i11.RouteConfig(
                      PortfolioStockListRoute.name,
                      path: '',
                      parent: PortfolioListRouter.name,
                    ),
                    _i11.RouteConfig(
                      AddStocksRoute.name,
                      path: 'addStocksScreen',
                      parent: PortfolioListRouter.name,
                    ),
                  ],
                ),
                _i11.RouteConfig(
                  AddStocksRoute.name,
                  path: 'addStocksScreen',
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
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/authScreen',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboardScreen',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i11.PageRouteInfo<void> {
  const HomeRouter({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'homeScreen',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.StockListScreen]
class StockListRoute extends _i11.PageRouteInfo<void> {
  const StockListRoute()
      : super(
          StockListRoute.name,
          path: 'stockListScreen',
        );

  static const String name = 'StockListRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class PortfolioRouter extends _i11.PageRouteInfo<void> {
  const PortfolioRouter({List<_i11.PageRouteInfo>? children})
      : super(
          PortfolioRouter.name,
          path: 'portfolioScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.StockDetailScreen]
class StockDetailRoute extends _i11.PageRouteInfo<StockDetailRouteArgs> {
  StockDetailRoute({
    _i12.Key? key,
    required String companyName,
    required String symbol,
    required String ltp,
  }) : super(
          StockDetailRoute.name,
          path: 'stockDetailScreen',
          args: StockDetailRouteArgs(
            key: key,
            companyName: companyName,
            symbol: symbol,
            ltp: ltp,
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
  });

  final _i12.Key? key;

  final String companyName;

  final String symbol;

  final String ltp;

  @override
  String toString() {
    return 'StockDetailRouteArgs{key: $key, companyName: $companyName, symbol: $symbol, ltp: $ltp}';
  }
}

/// generated route for
/// [_i8.PortfolioScreen]
class PortfolioRoute extends _i11.PageRouteInfo<void> {
  const PortfolioRoute()
      : super(
          PortfolioRoute.name,
          path: '',
        );

  static const String name = 'PortfolioRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class PortfolioListRouter extends _i11.PageRouteInfo<void> {
  const PortfolioListRouter({List<_i11.PageRouteInfo>? children})
      : super(
          PortfolioListRouter.name,
          path: 'portfolioStockListScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioListRouter';
}

/// generated route for
/// [_i9.AddStocksScreen]
class AddStocksRoute extends _i11.PageRouteInfo<void> {
  const AddStocksRoute()
      : super(
          AddStocksRoute.name,
          path: 'addStocksScreen',
        );

  static const String name = 'AddStocksRoute';
}

/// generated route for
/// [_i10.PortfolioStockListScreen]
class PortfolioStockListRoute extends _i11.PageRouteInfo<void> {
  const PortfolioStockListRoute()
      : super(
          PortfolioStockListRoute.name,
          path: '',
        );

  static const String name = 'PortfolioStockListRoute';
}
