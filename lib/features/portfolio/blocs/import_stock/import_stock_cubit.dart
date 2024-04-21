import 'package:bloc/bloc.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/features/portfolio/models/excel_stock_data/excel_stock_data_model.dart';
import 'package:share_portfolio/repository/local_stock_repository.dart';

part 'import_stock_state.dart';
part 'import_stock_cubit.freezed.dart';

@Injectable()
class ImportStockCubit extends Cubit<ImportStockState> {
  final LocalStockRepository _localStockRepository;
  ImportStockCubit(
    this._localStockRepository,
  ) : super(
          const ImportStockState.initial(),
        );

  void importStocks(FilePickerResult pickedFile) {
    var bytes = pickedFile.files.single.bytes;
    var excel = Excel.decodeBytes(bytes!);
    final excelDataModelList = <ExcelStockDataModel>[];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        if (row[2]!.rowIndex != 0 &&
            row[6]!.rowIndex != 0 &&
            row[7]!.rowIndex != 0 &&
            row[8]!.rowIndex != 0) {
          final excelDataModel = ExcelStockDataModel(
            scrip: row[2]!.value.toString(),
            transactionTpe: row[6]!.value.toString(),
            quantity: int.parse(row[7]!.value.toString()),
            price: double.parse(row[8]!.value.toString()),
          );
          excelDataModelList.add(excelDataModel);
        }
      }
    }
  }
}
