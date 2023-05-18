// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_losers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopLosersModel _$$_TopLosersModelFromJson(Map<String, dynamic> json) =>
    _$_TopLosersModel(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      ltp: json['ltp'] as String,
      change: json['change'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$$_TopLosersModelToJson(_$_TopLosersModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'ltp': instance.ltp,
      'change': instance.change,
      'quantity': instance.quantity,
    };
