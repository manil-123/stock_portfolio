import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_portfolio/core/database/entity/local_stock_info.dart';
import 'package:share_portfolio/core/database/entity/nepse_timeseries_info.dart';
import 'package:share_portfolio/core/database/entity/stock_info.dart';
import 'package:share_portfolio/core/database/entity/top_gainers_info.dart';
import 'package:share_portfolio/core/database/entity/top_losers_info.dart';
import 'package:share_portfolio/core/database/entity/watchlist_info.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbPath = await getApplicationDocumentsDirectory();
    final dbFile = File(join(dbPath.path, 'portfolio.sqlite'));

    return NativeDatabase(dbFile);
  });
}

@DriftDatabase(tables: [
  NepseTimeSeriesInfo,
  TopGainersInfo,
  TopLosersInfo,
  StockInfo,
  LocalStockInfo,
  WatchlistInfo,
])
@LazySingleton()
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.drop(stockInfo);
        }
        if (from < 2) {
          await m.drop(localStockInfo);
        }
        if (from < 3) {
          await m.drop(watchlistInfo);
        }
        await m.createAll();
      },
    );
  }
}
