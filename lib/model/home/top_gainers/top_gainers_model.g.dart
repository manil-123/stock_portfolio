// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_gainers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopGainersModelImpl _$$TopGainersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopGainersModelImpl(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      ltp: json['ltp'] as String,
      change: json['change'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$$TopGainersModelImplToJson(
        _$TopGainersModelImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'ltp': instance.ltp,
      'change': instance.change,
      'quantity': instance.quantity,
    };
