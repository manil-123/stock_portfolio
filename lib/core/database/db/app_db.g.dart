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

class $TopGainersInfoTable extends TopGainersInfo
    with TableInfo<$TopGainersInfoTable, TopGainersInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopGainersInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ltpMeta = const VerificationMeta('ltp');
  @override
  late final GeneratedColumn<String> ltp = GeneratedColumn<String>(
      'ltp', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _changeMeta = const VerificationMeta('change');
  @override
  late final GeneratedColumn<String> change = GeneratedColumn<String>(
      'change', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
      'quantity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [symbol, companyName, ltp, change, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'top_gainers_info';
  @override
  VerificationContext validateIntegrity(Insertable<TopGainersInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('ltp')) {
      context.handle(
          _ltpMeta, ltp.isAcceptableOrUnknown(data['ltp']!, _ltpMeta));
    } else if (isInserting) {
      context.missing(_ltpMeta);
    }
    if (data.containsKey('change')) {
      context.handle(_changeMeta,
          change.isAcceptableOrUnknown(data['change']!, _changeMeta));
    } else if (isInserting) {
      context.missing(_changeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TopGainersInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopGainersInfoData(
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      ltp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ltp'])!,
      change: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}change'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $TopGainersInfoTable createAlias(String alias) {
    return $TopGainersInfoTable(attachedDatabase, alias);
  }
}

class TopGainersInfoData extends DataClass
    implements Insertable<TopGainersInfoData> {
  final String symbol;
  final String companyName;
  final String ltp;
  final String change;
  final String quantity;
  const TopGainersInfoData(
      {required this.symbol,
      required this.companyName,
      required this.ltp,
      required this.change,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    map['company_name'] = Variable<String>(companyName);
    map['ltp'] = Variable<String>(ltp);
    map['change'] = Variable<String>(change);
    map['quantity'] = Variable<String>(quantity);
    return map;
  }

  TopGainersInfoCompanion toCompanion(bool nullToAbsent) {
    return TopGainersInfoCompanion(
      symbol: Value(symbol),
      companyName: Value(companyName),
      ltp: Value(ltp),
      change: Value(change),
      quantity: Value(quantity),
    );
  }

  factory TopGainersInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopGainersInfoData(
      symbol: serializer.fromJson<String>(json['symbol']),
      companyName: serializer.fromJson<String>(json['companyName']),
      ltp: serializer.fromJson<String>(json['ltp']),
      change: serializer.fromJson<String>(json['change']),
      quantity: serializer.fromJson<String>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'companyName': serializer.toJson<String>(companyName),
      'ltp': serializer.toJson<String>(ltp),
      'change': serializer.toJson<String>(change),
      'quantity': serializer.toJson<String>(quantity),
    };
  }

  TopGainersInfoData copyWith(
          {String? symbol,
          String? companyName,
          String? ltp,
          String? change,
          String? quantity}) =>
      TopGainersInfoData(
        symbol: symbol ?? this.symbol,
        companyName: companyName ?? this.companyName,
        ltp: ltp ?? this.ltp,
        change: change ?? this.change,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('TopGainersInfoData(')
          ..write('symbol: $symbol, ')
          ..write('companyName: $companyName, ')
          ..write('ltp: $ltp, ')
          ..write('change: $change, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(symbol, companyName, ltp, change, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopGainersInfoData &&
          other.symbol == this.symbol &&
          other.companyName == this.companyName &&
          other.ltp == this.ltp &&
          other.change == this.change &&
          other.quantity == this.quantity);
}

class TopGainersInfoCompanion extends UpdateCompanion<TopGainersInfoData> {
  final Value<String> symbol;
  final Value<String> companyName;
  final Value<String> ltp;
  final Value<String> change;
  final Value<String> quantity;
  final Value<int> rowid;
  const TopGainersInfoCompanion({
    this.symbol = const Value.absent(),
    this.companyName = const Value.absent(),
    this.ltp = const Value.absent(),
    this.change = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopGainersInfoCompanion.insert({
    required String symbol,
    required String companyName,
    required String ltp,
    required String change,
    required String quantity,
    this.rowid = const Value.absent(),
  })  : symbol = Value(symbol),
        companyName = Value(companyName),
        ltp = Value(ltp),
        change = Value(change),
        quantity = Value(quantity);
  static Insertable<TopGainersInfoData> custom({
    Expression<String>? symbol,
    Expression<String>? companyName,
    Expression<String>? ltp,
    Expression<String>? change,
    Expression<String>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (companyName != null) 'company_name': companyName,
      if (ltp != null) 'ltp': ltp,
      if (change != null) 'change': change,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopGainersInfoCompanion copyWith(
      {Value<String>? symbol,
      Value<String>? companyName,
      Value<String>? ltp,
      Value<String>? change,
      Value<String>? quantity,
      Value<int>? rowid}) {
    return TopGainersInfoCompanion(
      symbol: symbol ?? this.symbol,
      companyName: companyName ?? this.companyName,
      ltp: ltp ?? this.ltp,
      change: change ?? this.change,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (ltp.present) {
      map['ltp'] = Variable<String>(ltp.value);
    }
    if (change.present) {
      map['change'] = Variable<String>(change.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopGainersInfoCompanion(')
          ..write('symbol: $symbol, ')
          ..write('companyName: $companyName, ')
          ..write('ltp: $ltp, ')
          ..write('change: $change, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopLosersInfoTable extends TopLosersInfo
    with TableInfo<$TopLosersInfoTable, TopLosersInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopLosersInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ltpMeta = const VerificationMeta('ltp');
  @override
  late final GeneratedColumn<String> ltp = GeneratedColumn<String>(
      'ltp', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _changeMeta = const VerificationMeta('change');
  @override
  late final GeneratedColumn<String> change = GeneratedColumn<String>(
      'change', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
      'quantity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [symbol, companyName, ltp, change, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'top_losers_info';
  @override
  VerificationContext validateIntegrity(Insertable<TopLosersInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('ltp')) {
      context.handle(
          _ltpMeta, ltp.isAcceptableOrUnknown(data['ltp']!, _ltpMeta));
    } else if (isInserting) {
      context.missing(_ltpMeta);
    }
    if (data.containsKey('change')) {
      context.handle(_changeMeta,
          change.isAcceptableOrUnknown(data['change']!, _changeMeta));
    } else if (isInserting) {
      context.missing(_changeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TopLosersInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopLosersInfoData(
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      ltp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ltp'])!,
      change: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}change'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $TopLosersInfoTable createAlias(String alias) {
    return $TopLosersInfoTable(attachedDatabase, alias);
  }
}

class TopLosersInfoData extends DataClass
    implements Insertable<TopLosersInfoData> {
  final String symbol;
  final String companyName;
  final String ltp;
  final String change;
  final String quantity;
  const TopLosersInfoData(
      {required this.symbol,
      required this.companyName,
      required this.ltp,
      required this.change,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    map['company_name'] = Variable<String>(companyName);
    map['ltp'] = Variable<String>(ltp);
    map['change'] = Variable<String>(change);
    map['quantity'] = Variable<String>(quantity);
    return map;
  }

  TopLosersInfoCompanion toCompanion(bool nullToAbsent) {
    return TopLosersInfoCompanion(
      symbol: Value(symbol),
      companyName: Value(companyName),
      ltp: Value(ltp),
      change: Value(change),
      quantity: Value(quantity),
    );
  }

  factory TopLosersInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopLosersInfoData(
      symbol: serializer.fromJson<String>(json['symbol']),
      companyName: serializer.fromJson<String>(json['companyName']),
      ltp: serializer.fromJson<String>(json['ltp']),
      change: serializer.fromJson<String>(json['change']),
      quantity: serializer.fromJson<String>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'companyName': serializer.toJson<String>(companyName),
      'ltp': serializer.toJson<String>(ltp),
      'change': serializer.toJson<String>(change),
      'quantity': serializer.toJson<String>(quantity),
    };
  }

  TopLosersInfoData copyWith(
          {String? symbol,
          String? companyName,
          String? ltp,
          String? change,
          String? quantity}) =>
      TopLosersInfoData(
        symbol: symbol ?? this.symbol,
        companyName: companyName ?? this.companyName,
        ltp: ltp ?? this.ltp,
        change: change ?? this.change,
        quantity: quantity ?? this.quantity,
      );
  @override
  String toString() {
    return (StringBuffer('TopLosersInfoData(')
          ..write('symbol: $symbol, ')
          ..write('companyName: $companyName, ')
          ..write('ltp: $ltp, ')
          ..write('change: $change, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(symbol, companyName, ltp, change, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopLosersInfoData &&
          other.symbol == this.symbol &&
          other.companyName == this.companyName &&
          other.ltp == this.ltp &&
          other.change == this.change &&
          other.quantity == this.quantity);
}

class TopLosersInfoCompanion extends UpdateCompanion<TopLosersInfoData> {
  final Value<String> symbol;
  final Value<String> companyName;
  final Value<String> ltp;
  final Value<String> change;
  final Value<String> quantity;
  final Value<int> rowid;
  const TopLosersInfoCompanion({
    this.symbol = const Value.absent(),
    this.companyName = const Value.absent(),
    this.ltp = const Value.absent(),
    this.change = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopLosersInfoCompanion.insert({
    required String symbol,
    required String companyName,
    required String ltp,
    required String change,
    required String quantity,
    this.rowid = const Value.absent(),
  })  : symbol = Value(symbol),
        companyName = Value(companyName),
        ltp = Value(ltp),
        change = Value(change),
        quantity = Value(quantity);
  static Insertable<TopLosersInfoData> custom({
    Expression<String>? symbol,
    Expression<String>? companyName,
    Expression<String>? ltp,
    Expression<String>? change,
    Expression<String>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (companyName != null) 'company_name': companyName,
      if (ltp != null) 'ltp': ltp,
      if (change != null) 'change': change,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopLosersInfoCompanion copyWith(
      {Value<String>? symbol,
      Value<String>? companyName,
      Value<String>? ltp,
      Value<String>? change,
      Value<String>? quantity,
      Value<int>? rowid}) {
    return TopLosersInfoCompanion(
      symbol: symbol ?? this.symbol,
      companyName: companyName ?? this.companyName,
      ltp: ltp ?? this.ltp,
      change: change ?? this.change,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (ltp.present) {
      map['ltp'] = Variable<String>(ltp.value);
    }
    if (change.present) {
      map['change'] = Variable<String>(change.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopLosersInfoCompanion(')
          ..write('symbol: $symbol, ')
          ..write('companyName: $companyName, ')
          ..write('ltp: $ltp, ')
          ..write('change: $change, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $NepseTimeSeriesInfoTable nepseTimeSeriesInfo =
      $NepseTimeSeriesInfoTable(this);
  late final $TopGainersInfoTable topGainersInfo = $TopGainersInfoTable(this);
  late final $TopLosersInfoTable topLosersInfo = $TopLosersInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [nepseTimeSeriesInfo, topGainersInfo, topLosersInfo];
}
