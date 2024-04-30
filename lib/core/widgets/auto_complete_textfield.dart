import 'package:flutter/material.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';

typedef Filter<T> = bool Function(T suggestion, String query);

class StockPortfolioAutoCompleteTextfield extends StatefulWidget {
  const StockPortfolioAutoCompleteTextfield({
    super.key,
    required this.globalKey,
    required this.suggestions,
    this.decoration = const InputDecoration(),
    this.style,
    required this.itemBuilder,
    required this.itemSorter,
    required this.itemFilter,
    required this.itemSubmitted,
    this.maxAmount = 5,
  });

  final GlobalKey<StockPortfolioAutoCompleteTextfieldState> globalKey;
  final List<String> suggestions;
  final InputDecoration decoration;
  final TextStyle? style;
  final Widget Function(BuildContext, String)? itemBuilder;
  final int Function(String, String)? itemSorter;
  final bool Function(String, String)? itemFilter;
  final dynamic Function(String) itemSubmitted;
  final int maxAmount;

  @override
  State<StockPortfolioAutoCompleteTextfield> createState() =>
      StockPortfolioAutoCompleteTextfieldState();
}

class StockPortfolioAutoCompleteTextfieldState
    extends State<StockPortfolioAutoCompleteTextfield> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  List<String> suggestedItems = [];
  double dy = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: widget.decoration,
          style: widget.style,
          onChanged: (newText) {
            suggestedItems = getSuggestions(
                widget.suggestions,
                widget.itemSorter,
                widget.itemFilter,
                widget.maxAmount,
                newText);
            // Get the RenderBox of the key
            // RenderBox renderBox = widget.globalKey.currentContext!
            //     .findRenderObject() as RenderBox;

            // // Get the global position of the RenderBox
            // Offset offset = renderBox.localToGlobal(Offset.zero);
            // dy = offset.dy;
            setState(() {});
          },
        ),
        Visibility(
          visible: suggestedItems.isNotEmpty && _focusNode.hasFocus,
          child: Positioned(
            top: dy + 50,
            child: Container(
              height: 300,
              width: double.maxFinite,
              decoration: const BoxDecoration(color: AppColors.whiteBackground),
              child: ListView.builder(
                itemCount: suggestedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: Wrap(
                      children: [
                        Text(
                          suggestedItems[index],
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> getSuggestions(
      List<String> suggestions,
      Comparator<String>? sorter,
      Filter<String>? filter,
      int maxAmount,
      String? query) {
    suggestions = suggestions.where((item) => filter!(item, query!)).toList();
    suggestions.sort(sorter);
    if (suggestions.length > maxAmount) {
      suggestions = suggestions.sublist(0, maxAmount);
    }

    return suggestions;
  }
}
