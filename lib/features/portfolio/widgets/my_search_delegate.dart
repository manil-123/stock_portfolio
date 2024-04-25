import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_portfolio/core/router/app_router.gr.dart';
import 'package:share_portfolio/features/stock/models/stock_info_list.dart';
import 'package:share_portfolio/features/stock/models/stock_info_model.dart';
import 'package:share_portfolio/core/widgets/share_info_widget.dart';

class MySearchDelegate extends SearchDelegate {
  final StockInfoList? shareInfoList;

  MySearchDelegate({this.shareInfoList});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(
        // Use this to change the query's text style
        titleLarge: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF000000),
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) close(context, null);
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<StockInfoModel> suggestions =
        shareInfoList!.shareInfoList!.where((element) {
      final result = element.companyName.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            context.router.push(
              StockDetailRoute(
                companyName: suggestions[index].companyName,
                symbol: suggestions[index].symbol,
                ltp: suggestions[index].ltp,
                change: suggestions[index].change,
              ),
            );
          },
          child: ShareInfoWidget(
              companyName: suggestions[index].companyName,
              symbol: suggestions[index].symbol,
              ltp: suggestions[index].ltp,
              change: suggestions[index].change),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StockInfoModel> suggestions =
        shareInfoList!.shareInfoList!.where((element) {
      final result = element.companyName.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              context.router.push(
                StockDetailRoute(
                  companyName: suggestions[index].companyName,
                  symbol: suggestions[index].symbol,
                  ltp: suggestions[index].ltp,
                  change: suggestions[index].change,
                ),
              );
            },
            child: ShareInfoWidget(
                companyName: suggestions[index].companyName,
                symbol: suggestions[index].symbol,
                ltp: suggestions[index].ltp,
                change: suggestions[index].change),
          );
        }),
      ),
    );
  }
}
