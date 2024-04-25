// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchlistDataModelImpl _$$WatchlistDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchlistDataModelImpl(
      id: json['id'] as int?,
      symbol: json['symbol'] as String,
      companyName: json['companyName'] as String,
      sectorName: json['sectorName'] as String,
    );

Map<String, dynamic> _$$WatchlistDataModelImplToJson(
        _$WatchlistDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'companyName': instance.companyName,
      'sectorName': instance.sectorName,
    };
