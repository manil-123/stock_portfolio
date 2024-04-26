import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/dashboard/widgets/web_dashboard_drawer.dart';

class WebDashboardScreen extends StatelessWidget {
  WebDashboardScreen({super.key});

  final _innerRouterKey = GlobalKey<AutoRouterState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                20.verticalSpace,
                Text(
                  'Dashboard',
                  style: PortfolioTheme.textTheme.titleLarge!
                      .copyWith(color: AppColors.white),
                ),
                20.verticalSpace,
                Expanded(
                  child: WebDashboardDrawer(
                    contentRouter: _innerRouterKey,
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: AutoRouter(
              key: _innerRouterKey,
            ),
          ),
        ],
      ),
    );
  }
}
