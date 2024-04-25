// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockInfoModelImpl _$$StockInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$StockInfoModelImpl(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      ltp: json['ltp'] as String,
      change: json['change'] as String,
    );

Map<String, dynamic> _$$StockInfoModelImplToJson(
        _$StockInfoModelImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'ltp': instance.ltp,
      'change': instance.change,
    };
