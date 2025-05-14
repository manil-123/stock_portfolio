part of 'stock_list_bloc.dart';

@freezed
class StockListEvent with _$StockListEvent {
  const factory StockListEvent.loadShareList() = _LoadShareList;
}
