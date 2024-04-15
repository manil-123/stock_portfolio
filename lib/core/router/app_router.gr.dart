// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:share_portfolio/features/auth/views/auth_screen.dart' as _i2;
import 'package:share_portfolio/features/dashboard/dashboard_screen.dart'
    as _i3;
import 'package:share_portfolio/features/dashboard/dashboard_wrapper_screen.dart'
    as _i4;
import 'package:share_portfolio/features/home/views/home_screen.dart' as _i5;
import 'package:share_portfolio/features/home/views/home_wrapper_screen.dart'
    as _i6;
import 'package:share_portfolio/features/portfolio/views/add_stocks_screen.dart'
    as _i1;
import 'package:share_portfolio/features/portfolio/views/portfolio_screen.dart'
    as _i7;
import 'package:share_portfolio/features/portfolio/views/portfolio_stock_list_screen.dart'
    as _i8;
import 'package:share_portfolio/features/portfolio/views/portfolio_wrapper_screen.dart'
    as _i9;
import 'package:share_portfolio/features/stock/views/stock_detail_screen.dart'
    as _i11;
import 'package:share_portfolio/features/stock/views/stock_list_screen.dart'
    as _i12;
import 'package:share_portfolio/features/stock/views/stock_list_wrapper_screen.dart'
    as _i13;
import 'package:share_portfolio/features/watchlist/views/watchlist_screen.dart'
    as _i14;
import 'package:share_portfolio/splash_screen.dart' as _i10;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AddStocksRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddStocksScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
    DashboardWrapperRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i4.DashboardWrapperScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    HomeWrapperRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i6.HomeWrapperScreen()),
      );
    },
    PortfolioRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PortfolioScreen(),
      );
    },
    PortfolioStockListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PortfolioStockListScreen(),
      );
    },
    PortfolioWrapperRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i9.PortfolioWrapperScreen()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
    StockDetailRoute.name: (routeData) {
      final args = routeData.argsAs<StockDetailRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.StockDetailScreen(
          key: args.key,
          companyName: args.companyName,
          symbol: args.symbol,
          ltp: args.ltp,
          change: args.change,
        ),
      );
    },
    StockListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.StockListScreen(),
      );
    },
    StockListWrapperRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i13.StockListWrapperScreen()),
      );
    },
    WatchlistRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.WatchlistScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddStocksScreen]
class AddStocksRoute extends _i15.PageRouteInfo<void> {
  const AddStocksRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddStocksRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStocksRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i15.PageRouteInfo<void> {
  const AuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashboardWrapperScreen]
class DashboardWrapperRoute extends _i15.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeWrapperScreen]
class HomeWrapperRoute extends _i15.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PortfolioScreen]
class PortfolioRoute extends _i15.PageRouteInfo<void> {
  const PortfolioRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PortfolioRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PortfolioStockListScreen]
class PortfolioStockListRoute extends _i15.PageRouteInfo<void> {
  const PortfolioStockListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PortfolioStockListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioStockListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PortfolioWrapperScreen]
class PortfolioWrapperRoute extends _i15.PageRouteInfo<void> {
  const PortfolioWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PortfolioWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioWrapperRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.StockDetailScreen]
class StockDetailRoute extends _i15.PageRouteInfo<StockDetailRouteArgs> {
  StockDetailRoute({
    _i16.Key? key,
    required String companyName,
    required String symbol,
    required String ltp,
    required String change,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          StockDetailRoute.name,
          args: StockDetailRouteArgs(
            key: key,
            companyName: companyName,
            symbol: symbol,
            ltp: ltp,
            change: change,
          ),
          initialChildren: children,
        );

  static const String name = 'StockDetailRoute';

  static const _i15.PageInfo<StockDetailRouteArgs> page =
      _i15.PageInfo<StockDetailRouteArgs>(name);
}

class StockDetailRouteArgs {
  const StockDetailRouteArgs({
    this.key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  });

  final _i16.Key? key;

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
/// [_i12.StockListScreen]
class StockListRoute extends _i15.PageRouteInfo<void> {
  const StockListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StockListRoute.name,
          initialChildren: children,
        );

  static const String name = 'StockListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.StockListWrapperScreen]
class StockListWrapperRoute extends _i15.PageRouteInfo<void> {
  const StockListWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StockListWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'StockListWrapperRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WatchlistScreen]
class WatchlistRoute extends _i15.PageRouteInfo<void> {
  const WatchlistRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WatchlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WatchlistRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
