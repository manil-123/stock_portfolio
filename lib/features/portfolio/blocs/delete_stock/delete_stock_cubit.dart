import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/portfolio/models/local_stock_data/local_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'delete_stock_state.dart';
part 'delete_stock_cubit.freezed.dart';

@Injectable()
class DeleteStockCubit extends Cubit<DeleteStockState> {
  final LocalStockRepository _localStockRepository;

  DeleteStockCubit(
    this._localStockRepository,
  ) : super(
          const DeleteStockState.initial(),
        );

  void deleteStock(LocalStockDataModel localStockData) async {
    emit(
      const DeleteStockState.loading(),
    );
    try {
      await _localStockRepository.deleteStockFromPortfolio(localStockData);

      emit(
        const DeleteStockState.success(),
      );
    } catch (e) {
      emit(
        const DeleteStockState.failed(),
      );
    }
  }
}
