// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nepse_time_series_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NepseTimeSeriesDataImpl _$$NepseTimeSeriesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NepseTimeSeriesDataImpl(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      ltp: json['ltp'] as String,
      change: json['change'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$$NepseTimeSeriesDataImplToJson(
        _$NepseTimeSeriesDataImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'ltp': instance.ltp,
      'change': instance.change,
      'quantity': instance.quantity,
    };
