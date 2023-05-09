import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/model/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'add_stock_state.dart';
part 'add_stock_cubit.freezed.dart';

@LazySingleton()
class AddStockCubit extends Cubit<AddStockState> {
  final LocalStockRepository _localStockRepository;
  AddStockCubit(
    this._localStockRepository,
  ) : super(
          AddStockState.initial(),
        );

  void addStockToPortfolio(LocalStockDataModel localStockData) async {
    emit(
      AddStockState.loading(),
    );
    try {
      final result =
          await _localStockRepository.addStockToPortfolio(localStockData);
      if (result != 0) {
        emit(
          AddStockState.success(),
        );
      } else {
        emit(
          AddStockState.failed(),
        );
      }
    } catch (e) {
      emit(
        AddStockState.failed(),
      );
    }
  }
}
