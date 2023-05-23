import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/app/database/local_stock_dao.dart';
import 'package:share_portfolio/model/local_stock_data.dart';

part 'delete_stock_state.dart';
part 'delete_stock_cubit.freezed.dart';

@LazySingleton()
class DeleteStockCubit extends Cubit<DeleteStockState> {
  final LocalStockListDAO localStockListDAO;

  DeleteStockCubit(
    this.localStockListDAO,
  ) : super(
          DeleteStockState.initial(),
        );

  void deleteStock(LocalStockData localStockData) async {
    emit(
      DeleteStockState.loading(),
    );
    try {
      await localStockListDAO.delete(localStockData);
      emit(
        DeleteStockState.success(),
      );
    } catch (e) {
      emit(
        DeleteStockState.failed(),
      );
    }
  }
}
