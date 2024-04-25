import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:share_portfolio/core/constants/routes.dart';
import 'package:share_portfolio/splash_screen.dart';
import 'package:share_portfolio/features/auth/views/auth_screen.dart';
import 'package:share_portfolio/features/dashboard/dashboard_screen.dart';
import 'package:share_portfolio/features/home/views/home_screen.dart';
import 'package:share_portfolio/features/portfolio/views/add_stocks_screen.dart';
import 'package:share_portfolio/features/portfolio/views/portfolio_screen.dart';
import 'package:share_portfolio/features/portfolio/views/portfolio_stock_list_screen.dart';
import 'package:share_portfolio/features/stock/views/stock_detail_screen.dart';
import 'package:share_portfolio/features/stock/views/stock_list_screen.dart';
import 'package:share_portfolio/features/watchlist/views/watchlist_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: Routes.splashScreenRoute,
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      path: Routes.authScreenRoute,
      page: AuthScreen,
    ),
    AutoRoute(
      path: Routes.dashboardRoute,
      page: DashboardScreen,
      children: [
        AutoRoute(
          path: Routes.homeScreenRoute,
          name: 'HomeRouter',
          maintainState: true,
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomeScreen,
            ),
            AutoRoute(
              path: Routes.stockDetailScreenRoute,
              page: StockDetailScreen,
            ),
          ],
        ),
        AutoRoute(
          path: Routes.stockListScreenRoute,
          name: 'StockListRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: StockListScreen,
            ),
            AutoRoute(
              path: Routes.stockDetailScreenRoute,
              page: StockDetailScreen,
            ),
          ],
        ),
        AutoRoute(
          path: Routes.portfolioScreenRoute,
          name: 'PortfolioRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: PortfolioScreen,
            ),
            AutoRoute(
              path: Routes.portfolioStockListScreenRoute,
              name: 'PortfolioListRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: '',
                  page: PortfolioStockListScreen,
                ),
                AutoRoute(
                  path: Routes.addStocksScreenRoute,
                  page: AddStocksScreen,
                ),
              ],
            ),
            AutoRoute(
              path: Routes.addStocksScreenRoute,
              page: AddStocksScreen,
            ),
            AutoRoute(
              path: Routes.watchlistScreenRoute,
              page: WatchlistScreen,
            ),
          ],
        ),
      ],
    )
  ],
)
class $AppRouter {}
