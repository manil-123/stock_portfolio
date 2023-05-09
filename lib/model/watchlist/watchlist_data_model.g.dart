// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchlistDataModel _$$_WatchlistDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_WatchlistDataModel(
      id: json['id'] as int?,
      scrip: json['scrip'] as String,
      companyName: json['companyName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WatchlistDataModelToJson(
        _$_WatchlistDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scrip': instance.scrip,
      'companyName': instance.companyName,
      'price': instance.price,
    };
