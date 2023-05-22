import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/constants/constants.dart';
import 'package:share_portfolio/model/list_data_model.dart';

part 'load_add_stock_state.dart';
part 'load_add_stock_cubit.freezed.dart';

@injectable
class LoadAddStockCubit extends Cubit<LoadAddStockState> {
  LoadAddStockCubit()
      : super(
          LoadAddStockState.initial(),
        );

  void loadAddStockScreen() {
    var selectedMarket = MarketEnum.SECONDARY;
    final List<String> sectorNames =
        ListDataModel.companySectorData.values.toList();
    final List<String> companyNames =
        ListDataModel.scripCompanyNameData.values.toList();
    Map<String, String> scripCompanyNameMap =
        ListDataModel.scripCompanyNameData;
    Map<String, String> companySectorNameMap = ListDataModel.companySectorData;

    emit(
      LoadAddStockState.loaded(
        sectorNames: sectorNames,
        companyNames: companyNames,
        scripCompanyNameMap: scripCompanyNameMap,
        companySectorNameMap: companySectorNameMap,
        selectedMarket: selectedMarket,
      ),
    );
  }

  void selectMarket(MarketEnum selectedMarket) {
    emit(
      state.maybeMap(
          loaded: (state) => state.copyWith(selectedMarket: selectedMarket),
          orElse: () {
            return state;
          }),
    );
  }

  String getSector(String companyName) {
    final sector = state.maybeMap(
        loaded: (state) => state.companySectorNameMap[companyName]!,
        orElse: () => '');
    return sector;
  }
}
