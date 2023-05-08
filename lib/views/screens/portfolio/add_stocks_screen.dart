import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/theme/app_colors.dart';
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/views/widgets/custom_text_field.dart';

class AddStocksScreen extends StatefulWidget {
  const AddStocksScreen({
    Key? key,
  }) : super(key: key);
  @override
  _AddStocksScreenState createState() => _AddStocksScreenState();
}

class _AddStocksScreenState extends State<AddStocksScreen> {
  final _companyNameController = TextEditingController();
  final _scripNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> companyNameKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<LoadAddStockCubit>().loadAddStockScreen();
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _scripNameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        appBar: AppBar(
          title: const Text('Add Details'),
        ),
        body: BlocListener<AddStockCubit, AddStockState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                showInfo(context, "Stock added Successfully");
                Navigator.pop(context);
              },
              failed: () {
                showErrorInfo(context, "Failed to add stock");
              },
            );
          },
          child: BlocBuilder<LoadAddStockCubit, LoadAddStockState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (
                  List<String> sectorNames,
                  List<String> companyNames,
                  Map<String, String> scripCompanyNameMap,
                  Map<String, String> companySectorNameMap,
                  MarketEnum selectedMarket,
                ) =>
                    _loadedWidget(
                  sectorNames,
                  companyNames,
                  scripCompanyNameMap,
                  companySectorNameMap,
                  selectedMarket,
                ),
                orElse: () => const Center(
                  child: Text('Failed to load portfolio'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _loadedWidget(
    List<String> sectorNames,
    List<String> companyNames,
    Map<String, String> scripCompanyNameMap,
    Map<String, String> companySectorNameMap,
    MarketEnum selectedMarket,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 12),
            buildAutoCompleteTextField(companyNames, scripCompanyNameMap),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: _scripNameController,
              readOnly: true,
              validator: (String? val) {
                if (val!.isEmpty) return "Scrip field should not be empty";
                return null;
              },
              labelText: 'Scrip',
            ),
            RadioListTile(
              title: const Text('IPO'),
              value: MarketEnum.IPO,
              groupValue: selectedMarket,
              onChanged: (MarketEnum? newValue) {
                _priceController.text = "100";
                context.read<LoadAddStockCubit>().selectMarket(newValue!);
              },
            ),
            RadioListTile(
              title: const Text('Secondary'),
              value: MarketEnum.SECONDARY,
              groupValue: selectedMarket,
              onChanged: (MarketEnum? newValue) {
                context.read<LoadAddStockCubit>().selectMarket(newValue!);
              },
            ),
            Column(
              children: [
                CustomTextFormField(
                  controller: _quantityController,
                  validator: (String? val) {
                    if (val!.isEmpty)
                      return "Quantity field should not be empty";
                    else if (int.parse(val) == 0) return "Quantity cannot be 0";
                    return null;
                  },
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: false),
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  labelText: 'Quantity',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _priceController,
                  readOnly: selectedMarket == MarketEnum.IPO ? true : false,
                  validator: (String? val) {
                    if (val!.isEmpty)
                      return "Price field should not be empty";
                    else if (double.parse(val) == 0.0)
                      return "Price cannot be 0";
                    return null;
                  },
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  labelText: 'Price',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AddStockCubit, AddStockState>(
              builder: (context, addStockState) {
                return ElevatedButton(
                  onPressed: () => _addStock(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: addStockState.maybeMap(
                        loading: (value) => const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        orElse: () => const Text(
                          'ADD',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addStock() {
    if (_companyNameController.text.isEmpty) {
      showErrorInfo(context, "Please select a company");
    }
    if (_formKey.currentState!.validate()) {
      var sectorName = context
          .read<LoadAddStockCubit>()
          .getSector(_companyNameController.text);
      var localStockData = LocalStockDataModel(
        scrip: _scripNameController.text,
        companyName: _companyNameController.text,
        sectorName: sectorName,
        quantity: int.parse(_quantityController.text),
        price: double.parse(_priceController.text),
      );
      getIt<AddStockCubit>().addStockToPortfolio(localStockData);
    }
  }

  Widget buildAutoCompleteTextField(
      List<String> companyNames, Map<String, String> scripCompanyNameMap) {
    return AutoCompleteTextField<String>(
      key: companyNameKey,
      suggestions: companyNames,
      clearOnSubmit: false,
      decoration: InputDecoration(
        labelText: 'Enter Company Name',
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
      ),
      textChanged: (text) {
        // return scripNameController.text = text;
      },
      itemFilter: (item, query) {
        return item.toLowerCase().contains(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        _companyNameController.text = item;
        _scripNameController.text = scripCompanyNameMap.keys.firstWhere(
            (element) =>
                scripCompanyNameMap[element] == _companyNameController.text);
      },
      itemBuilder: (context, item) {
        return suggestionBox(item);
      },
    );
  }

  Widget suggestionBox(String item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Wrap(
        children: [
          Text(
            item,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
