import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/dashboard/widgets/drawer_item.dart';
import 'package:share_portfolio/features/home/views/home_screen.dart';
import 'package:share_portfolio/features/portfolio/views/portfolio_screen.dart';
import 'package:share_portfolio/features/stock/views/stock_list_screen.dart';

class WebDashboardScreen extends HookWidget {
  const WebDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerIndex = useState<int>(0);
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Dashboard',
                  style: PortfolioTheme.textTheme.titleLarge!
                      .copyWith(color: AppColors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Drawer(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      children: [
                        DrawerItem(
                          name: 'Home',
                          iconData: Icons.grid_view_rounded,
                          isSelected: drawerIndex.value == 0,
                          onTap: () {
                            if (drawerIndex.value != 0) {
                              drawerIndex.value = 0;
                            }
                          },
                        ),
                        DrawerItem(
                          name: 'Market',
                          iconData: Icons.published_with_changes,
                          isSelected: drawerIndex.value == 1,
                          onTap: () {
                            if (drawerIndex.value != 1) {
                              drawerIndex.value = 1;
                            }
                          },
                        ),
                        DrawerItem(
                          name: 'Portfolio',
                          iconData: Icons.density_medium,
                          isSelected: drawerIndex.value == 2,
                          onTap: () {
                            if (drawerIndex.value != 2) {
                              drawerIndex.value = 2;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: drawerIndex.value == 0
                ? const HomeScreen()
                : drawerIndex.value == 1
                    ? const StockListScreen()
                    : const PortfolioScreen(),
          ),
        ],
      ),
    );
  }
}
