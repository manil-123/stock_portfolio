import 'package:auto_route/auto_route.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';
import 'package:share_portfolio/features/portfolio/blocs/add_stock/add_stock_cubit.dart';
import 'package:share_portfolio/features/portfolio/blocs/load_add_stocks/load_add_stock_cubit.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data_model.dart';
import 'package:share_portfolio/core/widgets/custom_text_field.dart';

@RoutePage()
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
        backgroundColor: AppColors.whiteBackground,
        appBar: AppBar(
          title: const Text(AppStrings.addDetails),
        ),
        body: BlocListener<AddStockCubit, AddStockState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                showInfo(context, AppStrings.stockAddedSuccessfully);
                Navigator.pop(context);
              },
              failed: () {
                showErrorInfo(context, AppStrings.failedToAddStock);
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
                  child: Text(AppStrings.failedToLoadPortfolio),
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            8.verticalSpace,
            buildAutoCompleteTextField(companyNames, scripCompanyNameMap),
            16.verticalSpace,
            CustomTextFormField(
              controller: _scripNameController,
              readOnly: true,
              validator: (String? val) {
                if (val!.isEmpty) return ValidationStrings.scripFieldValidation;
                return null;
              },
              labelText: AppStrings.scrip,
            ),
            RadioListTile(
              title: Text(
                AppStrings.ipo,
                style: PortfolioTheme.textTheme.bodyMedium!
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
              value: MarketEnum.IPO,
              groupValue: selectedMarket,
              onChanged: (MarketEnum? newValue) {
                _priceController.text = "100";
                context.read<LoadAddStockCubit>().selectMarket(newValue!);
              },
            ),
            RadioListTile(
              title: Text(
                AppStrings.secondary,
                style: PortfolioTheme.textTheme.bodyMedium!
                    .copyWith(color: AppColors.primary, fontSize: 14.sp),
              ),
              value: MarketEnum.SECONDARY,
              groupValue: selectedMarket,
              onChanged: (MarketEnum? newValue) {
                context.read<LoadAddStockCubit>().selectMarket(newValue!);
              },
            ),
            CustomTextFormField(
              controller: _quantityController,
              validator: (String? val) {
                if (val!.isEmpty)
                  return ValidationStrings.quantityFieldValidation;
                else if (int.parse(val) == 0)
                  return ValidationStrings.quantityZeroValidation;
                return null;
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              inputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              labelText: AppStrings.quantity,
            ),
            16.verticalSpace,
            CustomTextFormField(
              controller: _priceController,
              readOnly: selectedMarket == MarketEnum.IPO ? true : false,
              validator: (String? val) {
                if (val!.isEmpty)
                  return ValidationStrings.priceFieldValidation;
                else if (double.parse(val) == 0.0)
                  return ValidationStrings.priceZeroValidation;
                return null;
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              labelText: AppStrings.price,
            ),
            24.verticalSpace,
            BlocBuilder<AddStockCubit, AddStockState>(
              builder: (context, addStockState) {
                return ElevatedButton(
                  onPressed: () => _addStock(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: addStockState.maybeMap(
                        loading: (value) => const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        orElse: () => Text(
                          AppStrings.add,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
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
      showErrorInfo(context, ValidationStrings.selectCompanyValidation);
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
      context.read<AddStockCubit>().addStockToPortfolio(localStockData);
    }
  }

  Widget buildAutoCompleteTextField(
      List<String> companyNames, Map<String, String> scripCompanyNameMap) {
    return AutoCompleteTextField<String>(
      key: companyNameKey,
      suggestions: companyNames,
      clearOnSubmit: false,
      style: PortfolioTheme.textTheme.bodyMedium!
          .copyWith(color: AppColors.primary, fontSize: 14.sp),
      decoration: InputDecoration(
        labelText: AppStrings.enterCompanyName,
        labelStyle: PortfolioTheme.textTheme.bodyMedium!
            .copyWith(color: AppColors.primary, fontSize: 14.sp),
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
            style: TextStyle(fontSize: 14.sp, color: Colors.black),
          )
        ],
      ),
    );
  }
}
