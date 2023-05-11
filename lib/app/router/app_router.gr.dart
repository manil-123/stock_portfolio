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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../splash_screen.dart' as _i1;
import '../../views/screens/auth/auth_screen.dart' as _i2;
import '../../views/screens/dashboard/dashboard_screen.dart' as _i3;
import '../../views/screens/home/home_screen.dart' as _i4;
import '../../views/screens/portfolio/auto_portfolio_screen.dart' as _i6;
import '../../views/screens/stock/stock_list_screen.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    StockListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StockListScreen(),
      );
    },
    AutoPortfolioRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AutoPortfolioScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          AuthRoute.name,
          path: '/authScreen',
        ),
        _i7.RouteConfig(
          DashboardRoute.name,
          path: '/dashboardScreen',
          children: [
            _i7.RouteConfig(
              HomeRoute.name,
              path: 'homeScreen',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              StockListRoute.name,
              path: 'stockListScreen',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
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
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/authScreen',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboardScreen',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'homeScreen',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.StockListScreen]
class StockListRoute extends _i7.PageRouteInfo<void> {
  const StockListRoute()
      : super(
          StockListRoute.name,
          path: 'stockListScreen',
        );

  static const String name = 'StockListRoute';
}

/// generated route for
/// [_i6.AutoPortfolioScreen]
class AutoPortfolioRoute extends _i7.PageRouteInfo<void> {
  const AutoPortfolioRoute()
      : super(
          AutoPortfolioRoute.name,
          path: 'autoPortfolioScreen',
        );

  static const String name = 'AutoPortfolioRoute';
}
