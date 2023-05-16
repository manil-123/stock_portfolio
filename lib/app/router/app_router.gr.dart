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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i11;

import '../../splash_screen.dart' as _i1;
import '../../views/screens/auth/auth_screen.dart' as _i2;
import '../../views/screens/dashboard/dashboard_screen.dart' as _i3;
import '../../views/screens/home/home_screen.dart' as _i4;
import '../../views/screens/portfolio/add_stocks_screen.dart' as _i9;
import '../../views/screens/portfolio/portfolio_screen.dart' as _i7;
import '../../views/screens/portfolio/portfolio_stock_list_screen.dart' as _i8;
import '../../views/screens/stock/stock_list_screen.dart' as _i5;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    StockListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StockListScreen(),
      );
    },
    PortfolioRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    PortfolioRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PortfolioScreen(),
      );
    },
    PortfolioListRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    PortfolioStockListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.PortfolioStockListScreen(),
      );
    },
    AddStocksRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AddStocksScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          AuthRoute.name,
          path: '/authScreen',
        ),
        _i10.RouteConfig(
          DashboardRoute.name,
          path: '/dashboardScreen',
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: 'homeScreen',
              parent: DashboardRoute.name,
            ),
            _i10.RouteConfig(
              StockListRoute.name,
              path: 'stockListScreen',
              parent: DashboardRoute.name,
            ),
            _i10.RouteConfig(
              PortfolioRouter.name,
              path: 'portfolioScreen',
              parent: DashboardRoute.name,
              children: [
                _i10.RouteConfig(
                  PortfolioRoute.name,
                  path: '',
                  parent: PortfolioRouter.name,
                ),
                _i10.RouteConfig(
                  PortfolioListRouter.name,
                  path: 'portfolioStockListScreen',
                  parent: PortfolioRouter.name,
                  children: [
                    _i10.RouteConfig(
                      PortfolioStockListRoute.name,
                      path: '',
                      parent: PortfolioListRouter.name,
                    ),
                    _i10.RouteConfig(
                      AddStocksRoute.name,
                      path: 'addStocksScreen',
                      parent: PortfolioListRouter.name,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/authScreen',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboardScreen',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'homeScreen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.StockListScreen]
class StockListRoute extends _i10.PageRouteInfo<void> {
  const StockListRoute()
      : super(
          StockListRoute.name,
          path: 'stockListScreen',
        );

  static const String name = 'StockListRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class PortfolioRouter extends _i10.PageRouteInfo<void> {
  const PortfolioRouter({List<_i10.PageRouteInfo>? children})
      : super(
          PortfolioRouter.name,
          path: 'portfolioScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioRouter';
}

/// generated route for
/// [_i7.PortfolioScreen]
class PortfolioRoute extends _i10.PageRouteInfo<void> {
  const PortfolioRoute()
      : super(
          PortfolioRoute.name,
          path: '',
        );

  static const String name = 'PortfolioRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class PortfolioListRouter extends _i10.PageRouteInfo<void> {
  const PortfolioListRouter({List<_i10.PageRouteInfo>? children})
      : super(
          PortfolioListRouter.name,
          path: 'portfolioStockListScreen',
          initialChildren: children,
        );

  static const String name = 'PortfolioListRouter';
}

/// generated route for
/// [_i8.PortfolioStockListScreen]
class PortfolioStockListRoute extends _i10.PageRouteInfo<void> {
  const PortfolioStockListRoute()
      : super(
          PortfolioStockListRoute.name,
          path: '',
        );

  static const String name = 'PortfolioStockListRoute';
}

/// generated route for
/// [_i9.AddStocksScreen]
class AddStocksRoute extends _i10.PageRouteInfo<void> {
  const AddStocksRoute()
      : super(
          AddStocksRoute.name,
          path: 'addStocksScreen',
        );

  static const String name = 'AddStocksRoute';
}
