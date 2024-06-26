import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_portfolio/core/router/app_router.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/utils/screen_size_checker.dart';
import 'package:share_portfolio/features/dashboard/web_dashboard_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return ScreenSizeChecker.isDesktop(context)
        ? WebDashboardScreen()
        : WillPopScope(
            onWillPop: () async {
              if (currentBackPressTime == null ||
                  DateTime.now().difference(currentBackPressTime!) >
                      const Duration(seconds: 2)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: Text(
                      "Press back again to exit",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    backgroundColor: AppColors.whiteBackground,
                    behavior: SnackBarBehavior.floating,
                    elevation: 0,
                  ),
                );
                // Update the current back press time
                currentBackPressTime = DateTime.now();
                return false;
              }
              return true;
            },
            child: AutoTabsScaffold(
              routes: const [
                HomeWrapperRoute(),
                StockListWrapperRoute(),
                WatchlistWrapperRoute(),
                PortfolioWrapperRoute(),
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                return BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey.withOpacity(0.8),
                  selectedItemColor: AppColors.whiteBackground,
                  selectedFontSize: 12.0,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: [
                    const BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.grid_view_rounded),
                        ),
                        label: 'Home'),
                    const BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.published_with_changes),
                        ),
                        label: 'Market'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(
                            'assets/icons/watchlist.svg',
                            colorFilter: ColorFilter.mode(
                                tabsRouter.activeIndex == 2
                                    ? AppColors.whiteBackground
                                    : Colors.grey.withOpacity(0.8),
                                BlendMode.srcIn),
                          ),
                        ),
                        label: 'Watchlist'),
                    const BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.density_medium),
                        ),
                        label: 'Portfolio'),
                  ],
                );
              },
            ),
          );
  }
}
