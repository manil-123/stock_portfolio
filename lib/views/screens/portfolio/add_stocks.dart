import 'dart:developer';

import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_portfolio/model/local_stock_data.dart';
import '../../../data/local_stock_dao.dart';
import '../../../model/list_data_model.dart';

enum Market { IPO, SECONDARY }

class AddStocks extends StatefulWidget {
  @override
  _AddStocksState createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {
  final companyNameController = TextEditingController();
  final scripNameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> companyNameKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final LocalStockListDAO _localStockListDAO = LocalStockListDAO();

  var selectedMarket = Market.SECONDARY;
  List<String> sectorNames = [];
  List<String> companyNames = [];
  Map<String, String> scripCompanyName = ListDataModel.scripCompanyNameData;
  Map<String, String> companySectorName = ListDataModel.companySectorData;

  void getData() async {
    for (String value in scripCompanyName.values) {
      companyNames.add(value);
    }
    for (String value in companySectorName.values) {
      sectorNames.add(value);
    }
  }

  String getSector(String companyName) {
    return companySectorName[companyName]!;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView(
          children: [
            SizedBox(height: 12),
            AutoCompleteTextField<String>(
              key: companyNameKey,
              suggestions: companyNames,
              clearOnSubmit: false,
              decoration: InputDecoration(
                labelText: 'Enter Company Name',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
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
                  companyNameController.text = item;
                  scripNameController.text = scripCompanyName.keys.firstWhere(
                      (element) =>
                          scripCompanyName[element] ==
                          companyNameController.text);
                });
              },
              itemBuilder: (context, item) {
                return suggestionBox(item);
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: scripNameController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Scrip',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.0),
                ),
              ),
            ),
            RadioListTile(
              title: Text('IPO'),
              value: Market.IPO,
              groupValue: selectedMarket,
              onChanged: (Market? newValue) =>
                  setState(() => selectedMarket = newValue!),
            ),
            RadioListTile(
              title: Text('Secondary'),
              value: Market.SECONDARY,
              groupValue: selectedMarket,
              onChanged: (Market? newValue) =>
                  setState(() => selectedMarket = newValue!),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: quantityController,
                    validator: (String? val) {
                      if (val!.isEmpty)
                        return "Quantity field should not be empty";
                      else if (int.parse(val) == 0)
                        return "Quantity cannot be 0";
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: priceController,
                    validator: (String? val) {
                      if (val!.isEmpty)
                        return "Price field should not be empty";
                      else if (int.parse(val) == 0) return "Price cannot be 0";
                    },
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    var sectorName = getSector(companyNameController.text);
                    var localStockData = LocalStockData(
                      scrip: scripNameController.text,
                      companyName: companyNameController.text,
                      sectorName: sectorName,
                      quantity: int.parse(quantityController.text),
                      price: int.parse(priceController.text),
                    );
                    _localStockListDAO.insert(localStockData);
                    Navigator.pop(context, true);
                    AlertDialog alertDialog = AlertDialog(
                      title: Text('Status'),
                      content: Text('Stock Added Successfully'),
                    );
                    showDialog(context: context, builder: (_) => alertDialog);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
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
    );
  }

  Widget suggestionBox(String item) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Wrap(
        children: [
          Expanded(
            child: Text(
              item,
              maxLines: 2,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
