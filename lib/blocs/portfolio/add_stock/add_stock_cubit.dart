import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';

part 'add_stock_state.dart';
part 'add_stock_cubit.freezed.dart';

@LazySingleton()
class AddStockCubit extends Cubit<AddStockState> {
  final LocalStockListDAO localStockListDAO;
  AddStockCubit(
    this.localStockListDAO,
  ) : super(
          AddStockState.initial(),
        );

  void addStockToPortfolio(LocalStockDataModel localStockData) async {
    emit(
      AddStockState.loading(),
    );
    try {
      await localStockListDAO.insert(localStockData);

      emit(
        AddStockState.success(),
      );
    } catch (e) {
      emit(
        AddStockState.failed(),
      );
    }
  }
}
