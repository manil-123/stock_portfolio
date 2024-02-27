// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nepse_time_series_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NepseTimeSeriesDataImpl _$$NepseTimeSeriesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NepseTimeSeriesDataImpl(
      date: json['date'] as String?,
      index: (json['index'] as num?)?.toDouble(),
      pointChange: (json['pointChange'] as num?)?.toDouble(),
      percentageChange: (json['percentageChange'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$NepseTimeSeriesDataImplToJson(
        _$NepseTimeSeriesDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'index': instance.index,
      'pointChange': instance.pointChange,
      'percentageChange': instance.percentageChange,
    };
