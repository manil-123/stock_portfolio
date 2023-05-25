// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_stock_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalStockDataModel _$$_LocalStockDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalStockDataModel(
      id: json['id'] as int?,
      scrip: json['scrip'] as String,
      companyName: json['companyName'] as String,
      sectorName: json['sectorName'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LocalStockDataModelToJson(
        _$_LocalStockDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scrip': instance.scrip,
      'companyName': instance.companyName,
      'sectorName': instance.sectorName,
      'quantity': instance.quantity,
      'price': instance.price,
    };
