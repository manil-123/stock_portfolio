import 'package:auto_route/auto_route.dart';
import 'package:share_portfolio/core/constants/routes.dart';
import 'package:share_portfolio/splash_screen.dart';
import 'package:share_portfolio/views/auth/auth_screen.dart';
import 'package:share_portfolio/views/screens/dashboard/dashboard_screen.dart';
import 'package:share_portfolio/views/screens/home/home_screen.dart';
import 'package:share_portfolio/views/screens/portfolio/auto_portfolio_screen.dart';
import 'package:share_portfolio/views/screens/stock/stock_list_screen.dart';

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
          page: HomeScreen,
        ),
        AutoRoute(
          path: Routes.stockListScreenRoute,
          page: StockListScreen,
        ),
        AutoRoute(
          path: Routes.autoPortfolioScreenRoute,
          page: AutoPortfolioScreen,
        ),
      ],
    )
  ],
)
class $AppRouter {}
