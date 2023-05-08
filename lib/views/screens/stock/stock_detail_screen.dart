import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/model/list_data_model.dart';
import 'package:share_portfolio/model/watchlist/watchlist_data_model.dart';

class StockDetailScreen extends StatefulWidget {
  final String companyName;
  final String symbol;
  final String ltp;
  final String change;

  const StockDetailScreen({
    super.key,
    required this.companyName,
    required this.symbol,
    required this.ltp,
    required this.change,
  });

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.symbol),
        centerTitle: true,
      ),
      body: BlocListener<AddToWatchlistCubit, AddToWatchlistState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              showInfo(context, "Stock added to watchlist successfully");
              Navigator.pop(context);
            },
            failed: (errorMessage) {
              showErrorInfo(context, errorMessage);
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.companyName}(${widget.symbol})',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  'Sector : ${getSector(widget.companyName)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Center(
                    child: Text('Chart'),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _moreInfo('Last Traded Price', 'Rs. ${widget.ltp}'),
                _moreInfo('Change', 'Rs. ${widget.change}'),
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: BlocBuilder<AddToWatchlistCubit, AddToWatchlistState>(
                    builder: (context, addToWatchlistState) {
                      return ElevatedButton(
                        onPressed: () => _addToWatchlist(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          child: addToWatchlistState.maybeMap(
                            loading: (value) => const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            orElse: () {
                              return const Text(
                                'ADD TO WATCHLIST',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addToWatchlist() {
    BlocProvider.of<AddToWatchlistCubit>(context).addStockToWatchList(
      WatchlistDataModel(
        scrip: widget.symbol,
        companyName: widget.companyName,
        price: double.parse(widget.ltp),
        sectorName: getSector(widget.companyName),
      ),
    );
  }

  Widget _moreInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: double.parse(widget.change) == 0
                  ? Colors.white
                  : double.parse(widget.change) > 0
                      ? AppColors.greenColor
                      : AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }

  String getSector(String companyName) {
    return ListDataModel.companySectorData[companyName] ?? '---';
  }
}
