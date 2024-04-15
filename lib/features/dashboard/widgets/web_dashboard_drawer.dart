import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/features/dashboard/widgets/drawer_item.dart';

class WebDashboardDrawer extends HookWidget {
  const WebDashboardDrawer({super.key, required this.contentRouter});

  final GlobalKey<AutoRouterState> contentRouter;

  @override
  Widget build(BuildContext context) {
    final drawerIndex = useState<int>(0);

    return Drawer(
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
                final router = contentRouter.currentState!.controller;
                router?.replace(
                  const HomeWrapperRoute(),
                );
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
                final router = contentRouter.currentState!.controller;
                router?.replace(
                  const StockListWrapperRoute(),
                );
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
                final router = contentRouter.currentState!.controller;
                router?.replace(
                  const PortfolioWrapperRoute(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
