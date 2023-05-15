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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../splash_screen.dart' as _i1;
import '../../views/screens/dashboard/dashboard_screen.dart' as _i2;
import '../../views/screens/home/home_screen.dart' as _i3;
import '../../views/screens/portfolio/auto_portfolio_screen.dart' as _i5;
import '../../views/screens/stock/stock_list_screen.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    StockListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.StockListScreen(),
      );
    },
    AutoPortfolioRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AutoPortfolioScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: '/dashboardScreen',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'homeScreen',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              StockListRoute.name,
              path: 'stockListScreen',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              AutoPortfolioRoute.name,
              path: 'autoPortfolioScreen',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboardScreen',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'homeScreen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.StockListScreen]
class StockListRoute extends _i6.PageRouteInfo<void> {
  const StockListRoute()
      : super(
          StockListRoute.name,
          path: 'stockListScreen',
        );

  static const String name = 'StockListRoute';
}

/// generated route for
/// [_i5.AutoPortfolioScreen]
class AutoPortfolioRoute extends _i6.PageRouteInfo<void> {
  const AutoPortfolioRoute()
      : super(
          AutoPortfolioRoute.name,
          path: 'autoPortfolioScreen',
        );

  static const String name = 'AutoPortfolioRoute';
}
