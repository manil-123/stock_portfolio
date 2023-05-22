import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/injection.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import 'package:share_portfolio/views/widgets/custom_text_field.dart';
import '../../../blocs/portfolio/portfolio_event.dart';
import '../../../model/list_data_model.dart';

enum Market { IPO, SECONDARY }

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

  var selectedMarket = Market.SECONDARY;
  final List<String> sectorNames =
      ListDataModel.companySectorData.values.toList();
  final List<String> companyNames =
      ListDataModel.scripCompanyNameData.values.toList();
  Map<String, String> scripCompanyName = ListDataModel.scripCompanyNameData;
  Map<String, String> companySectorName = ListDataModel.companySectorData;

  String getSector(String companyName) {
    return companySectorName[companyName]!;
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('Add Details'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 12),
                buildAutoCompleteTextField(),
                SizedBox(
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
                  title: Text('IPO'),
                  value: Market.IPO,
                  groupValue: selectedMarket,
                  onChanged: (Market? newValue) => setState(() {
                    selectedMarket = newValue!;
                    _priceController.text = "100";
                  }),
                ),
                RadioListTile(
                  title: Text('Secondary'),
                  value: Market.SECONDARY,
                  groupValue: selectedMarket,
                  onChanged: (Market? newValue) =>
                      setState(() => selectedMarket = newValue!),
                ),
                Column(
                  children: [
                    CustomTextFormField(
                      controller: _quantityController,
                      validator: (String? val) {
                        if (val!.isEmpty)
                          return "Quantity field should not be empty";
                        else if (int.parse(val) == 0)
                          return "Quantity cannot be 0";
                        return null;
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      labelText: 'Quantity',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: _priceController,
                      readOnly: selectedMarket == Market.IPO ? true : false,
                      validator: (String? val) {
                        if (val!.isEmpty)
                          return "Price field should not be empty";
                        else if (double.parse(val) == 0.0)
                          return "Price cannot be 0";
                        return null;
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatter: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                      ],
                      labelText: 'Price',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_companyNameController.text.isEmpty) {
                      showErrorInfo(context, "Please select a company");
                    }
                    if (_formKey.currentState!.validate()) {
                      var sectorName = getSector(_companyNameController.text);
                      var localStockData = LocalStockData(
                        scrip: _scripNameController.text,
                        companyName: _companyNameController.text,
                        sectorName: sectorName,
                        quantity: int.parse(_quantityController.text),
                        price: double.parse(_priceController.text),
                      );
                      getIt<PortfolioBloc>().add(
                        AddStock(localStockData: localStockData),
                      );
                      Fluttertoast.showToast(msg: 'Stock Added Successfully');
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAutoCompleteTextField() {
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
        setState(() {
          _companyNameController.text = item;
          _scripNameController.text = scripCompanyName.keys.firstWhere(
              (element) =>
                  scripCompanyName[element] == _companyNameController.text);
        });
      },
      itemBuilder: (context, item) {
        return suggestionBox(item);
      },
    );
  }

  Widget suggestionBox(String item) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Wrap(
        children: [
          Text(
            item,
            maxLines: 2,
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
