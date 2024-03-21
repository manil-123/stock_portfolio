// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $NepseTimeSeriesInfoTable extends NepseTimeSeriesInfo
    with TableInfo<$NepseTimeSeriesInfoTable, NepseTimeSeriesInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NepseTimeSeriesInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<String> index = GeneratedColumn<String>(
      'index', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pointChangeMeta =
      const VerificationMeta('pointChange');
  @override
  late final GeneratedColumn<String> pointChange = GeneratedColumn<String>(
      'point_change', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _percentageChangeMeta =
      const VerificationMeta('percentageChange');
  @override
  late final GeneratedColumn<String> percentageChange = GeneratedColumn<String>(
      'percentage_change', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [date, index, pointChange, percentageChange];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nepse_time_series_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<NepseTimeSeriesInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('point_change')) {
      context.handle(
          _pointChangeMeta,
          pointChange.isAcceptableOrUnknown(
              data['point_change']!, _pointChangeMeta));
    } else if (isInserting) {
      context.missing(_pointChangeMeta);
    }
    if (data.containsKey('percentage_change')) {
      context.handle(
          _percentageChangeMeta,
          percentageChange.isAcceptableOrUnknown(
              data['percentage_change']!, _percentageChangeMeta));
    } else if (isInserting) {
      context.missing(_percentageChangeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NepseTimeSeriesInfoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NepseTimeSeriesInfoData(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}index'])!,
      pointChange: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}point_change'])!,
      percentageChange: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}percentage_change'])!,
    );
  }

  @override
  $NepseTimeSeriesInfoTable createAlias(String alias) {
    return $NepseTimeSeriesInfoTable(attachedDatabase, alias);
  }
}

class NepseTimeSeriesInfoData extends DataClass
    implements Insertable<NepseTimeSeriesInfoData> {
  final String date;
  final String index;
  final String pointChange;
  final String percentageChange;
  const NepseTimeSeriesInfoData(
      {required this.date,
      required this.index,
      required this.pointChange,
      required this.percentageChange});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    map['index'] = Variable<String>(index);
    map['point_change'] = Variable<String>(pointChange);
    map['percentage_change'] = Variable<String>(percentageChange);
    return map;
  }

  NepseTimeSeriesInfoCompanion toCompanion(bool nullToAbsent) {
    return NepseTimeSeriesInfoCompanion(
      date: Value(date),
      index: Value(index),
      pointChange: Value(pointChange),
      percentageChange: Value(percentageChange),
    );
  }

  factory NepseTimeSeriesInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NepseTimeSeriesInfoData(
      date: serializer.fromJson<String>(json['date']),
      index: serializer.fromJson<String>(json['index']),
      pointChange: serializer.fromJson<String>(json['pointChange']),
      percentageChange: serializer.fromJson<String>(json['percentageChange']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'index': serializer.toJson<String>(index),
      'pointChange': serializer.toJson<String>(pointChange),
      'percentageChange': serializer.toJson<String>(percentageChange),
    };
  }

  NepseTimeSeriesInfoData copyWith(
          {String? date,
          String? index,
          String? pointChange,
          String? percentageChange}) =>
      NepseTimeSeriesInfoData(
        date: date ?? this.date,
        index: index ?? this.index,
        pointChange: pointChange ?? this.pointChange,
        percentageChange: percentageChange ?? this.percentageChange,
      );
  @override
  String toString() {
    return (StringBuffer('NepseTimeSeriesInfoData(')
          ..write('date: $date, ')
          ..write('index: $index, ')
          ..write('pointChange: $pointChange, ')
          ..write('percentageChange: $percentageChange')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, index, pointChange, percentageChange);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NepseTimeSeriesInfoData &&
          other.date == this.date &&
          other.index == this.index &&
          other.pointChange == this.pointChange &&
          other.percentageChange == this.percentageChange);
}

class NepseTimeSeriesInfoCompanion
    extends UpdateCompanion<NepseTimeSeriesInfoData> {
  final Value<String> date;
  final Value<String> index;
  final Value<String> pointChange;
  final Value<String> percentageChange;
  final Value<int> rowid;
  const NepseTimeSeriesInfoCompanion({
    this.date = const Value.absent(),
    this.index = const Value.absent(),
    this.pointChange = const Value.absent(),
    this.percentageChange = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NepseTimeSeriesInfoCompanion.insert({
    required String date,
    required String index,
    required String pointChange,
    required String percentageChange,
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        index = Value(index),
        pointChange = Value(pointChange),
        percentageChange = Value(percentageChange);
  static Insertable<NepseTimeSeriesInfoData> custom({
    Expression<String>? date,
    Expression<String>? index,
    Expression<String>? pointChange,
    Expression<String>? percentageChange,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (index != null) 'index': index,
      if (pointChange != null) 'point_change': pointChange,
      if (percentageChange != null) 'percentage_change': percentageChange,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NepseTimeSeriesInfoCompanion copyWith(
      {Value<String>? date,
      Value<String>? index,
      Value<String>? pointChange,
      Value<String>? percentageChange,
      Value<int>? rowid}) {
    return NepseTimeSeriesInfoCompanion(
      date: date ?? this.date,
      index: index ?? this.index,
      pointChange: pointChange ?? this.pointChange,
      percentageChange: percentageChange ?? this.percentageChange,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (index.present) {
      map['index'] = Variable<String>(index.value);
    }
    if (pointChange.present) {
      map['point_change'] = Variable<String>(pointChange.value);
    }
    if (percentageChange.present) {
      map['percentage_change'] = Variable<String>(percentageChange.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NepseTimeSeriesInfoCompanion(')
          ..write('date: $date, ')
          ..write('index: $index, ')
          ..write('pointChange: $pointChange, ')
          ..write('percentageChange: $percentageChange, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $NepseTimeSeriesInfoTable nepseTimeSeriesInfo =
      $NepseTimeSeriesInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nepseTimeSeriesInfo];
}
