import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'add_stock_state.dart';
part 'add_stock_cubit.freezed.dart';

@LazySingleton()
class AddStockCubit extends Cubit<AddStockState> {
  final LocalStockRepository _localStockRepository;
  AddStockCubit(
    this._localStockRepository,
  ) : super(
          const AddStockState.initial(),
        );

  void addStockToPortfolio(LocalStockDataModel localStockData) async {
    emit(
      const AddStockState.loading(),
    );
    try {
      await _localStockRepository.addStockToPortfolio(localStockData);
      emit(
        const AddStockState.success(),
      );
    } catch (e) {
      emit(
        const AddStockState.failed(),
      );
    }
  }
}
