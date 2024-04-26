import 'package:auto_route/auto_route.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';

export 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(
          page: DashboardWrapperRoute.page,
          children: [
            AutoRoute(
              page: DashboardRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  page: HomeWrapperRoute.page,
                  children: [
                    AutoRoute(page: HomeRoute.page, initial: true),
                    AutoRoute(page: StockDetailRoute.page),
                  ],
                ),
                AutoRoute(
                  page: StockListWrapperRoute.page,
                  children: [
                    AutoRoute(page: StockListRoute.page, initial: true),
                    AutoRoute(page: StockDetailRoute.page),
                  ],
                ),
                AutoRoute(
                  page: WatchlistWrapperRoute.page,
                  children: [
                    AutoRoute(page: WatchlistRoute.page, initial: true),
                    AutoRoute(page: StockDetailRoute.page),
                  ],
                ),
                AutoRoute(
                  page: PortfolioWrapperRoute.page,
                  children: [
                    AutoRoute(page: PortfolioRoute.page, initial: true),
                    AutoRoute(page: PortfolioStockListRoute.page),
                    AutoRoute(page: AddStocksRoute.page),
                  ],
                ),
              ],
            ),
          ],
        )
      ];
}
