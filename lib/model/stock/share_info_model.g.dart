// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareInfoModelImpl _$$ShareInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$ShareInfoModelImpl(
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      ltp: json['ltp'] as String,
      change: json['change'] as String,
    );

Map<String, dynamic> _$$ShareInfoModelImplToJson(
        _$ShareInfoModelImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'ltp': instance.ltp,
      'change': instance.change,
    };
