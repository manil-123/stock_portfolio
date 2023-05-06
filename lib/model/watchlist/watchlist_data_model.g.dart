// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchlistDataModel _$$_WatchlistDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_WatchlistDataModel(
      id: json['id'] as int?,
      symbol: json['symbol'] as String,
      companyName: json['companyName'] as String,
      sectorName: json['sectorName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WatchlistDataModelToJson(
        _$_WatchlistDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'companyName': instance.companyName,
      'sectorName': instance.sectorName,
      'price': instance.price,
    };
