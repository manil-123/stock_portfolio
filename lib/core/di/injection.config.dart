// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:share_portfolio/app/database/local_stock_dao.dart' as _i7;
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i11;
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart' as _i13;
import 'package:share_portfolio/blocs/auth/auth_bloc.dart' as _i16;
import 'package:share_portfolio/blocs/home/home_bloc.dart' as _i26;
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart'
    as _i23;
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart'
    as _i25;
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart'
    as _i5;
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart'
    as _i27;
import 'package:share_portfolio/blocs/portfolio/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart'
    as _i28;
import 'package:share_portfolio/blocs/share_list/share_list_bloc.dart' as _i22;
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart'
    as _i24;
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart'
    as _i29;
import 'package:share_portfolio/blocs/watchlist/remove_from_watchlist/remove_from_watchlist_cubit.dart'
    as _i21;
import 'package:share_portfolio/core/database/dao/nepse_timeseries_dao.dart'
    as _i8;
import 'package:share_portfolio/core/database/dao/stock_dao.dart' as _i12;
import 'package:share_portfolio/core/database/dao/top_gainers_dao.dart' as _i14;
import 'package:share_portfolio/core/database/dao/top_losers_dao.dart' as _i15;
import 'package:share_portfolio/core/database/db/app_db.dart' as _i3;
import 'package:share_portfolio/core/di/register_modules.dart' as _i30;
import 'package:share_portfolio/core/network/network_info.dart' as _i9;
import 'package:share_portfolio/repository/calculation_repo.dart' as _i17;
import 'package:share_portfolio/repository/local_stock_repository.dart' as _i19;
import 'package:share_portfolio/repository/nepse_repository.dart' as _i20;
import 'package:share_portfolio/services/data_service.dart' as _i18;
import 'package:share_portfolio/services/local_auth_service.dart' as _i6;
import 'package:share_portfolio/services/scrapper.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.lazySingleton<_i3.AppDB>(() => _i3.AppDB());
    gh.lazySingleton<_i4.InternetConnectionChecker>(
        () => registerModules.connectionChecker);
    gh.factory<_i5.LoadAddStockCubit>(() => _i5.LoadAddStockCubit());
    gh.lazySingleton<_i6.LocalAuthService>(() => _i6.LocalAuthService());
    gh.lazySingleton<_i7.LocalStockListDAO>(() => _i7.LocalStockListDAO());
    gh.lazySingleton<_i8.NepseTimeSeriesDao>(
        () => _i8.NepseTimeSeriesDao(gh<_i3.AppDB>()));
    gh.lazySingleton<_i9.NetworkInfo>(
        () => _i9.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
    gh.lazySingleton<_i10.Scrapper>(() => _i10.Scrapper());
    gh.lazySingleton<_i11.ShareInfoListDAO>(() => _i11.ShareInfoListDAO());
    gh.lazySingleton<_i12.StockDao>(() => _i12.StockDao(gh<_i3.AppDB>()));
    gh.lazySingleton<_i13.StockWatchlistDAO>(() => _i13.StockWatchlistDAO());
    gh.lazySingleton<_i14.TopGainersDao>(
        () => _i14.TopGainersDao(gh<_i3.AppDB>()));
    gh.lazySingleton<_i15.TopLosersDao>(
        () => _i15.TopLosersDao(gh<_i3.AppDB>()));
    gh.lazySingleton<_i16.AuthBloc>(
        () => _i16.AuthBloc(gh<_i6.LocalAuthService>()));
    gh.lazySingleton<_i17.CalculationRepository>(
        () => _i17.CalculationRepositoryImpl(
              shareInfoListDAO: gh<_i11.ShareInfoListDAO>(),
              localStockListDAO: gh<_i7.LocalStockListDAO>(),
            ));
    gh.lazySingleton<_i18.DataService>(() => _i18.DataService(
          gh<_i10.Scrapper>(),
          gh<_i8.NepseTimeSeriesDao>(),
          gh<_i14.TopGainersDao>(),
          gh<_i15.TopLosersDao>(),
          gh<_i12.StockDao>(),
        ));
    gh.lazySingleton<_i19.LocalStockRepository>(
        () => _i19.LocalStockRepositoryImpl(
              gh<_i7.LocalStockListDAO>(),
              gh<_i13.StockWatchlistDAO>(),
              gh<_i11.ShareInfoListDAO>(),
            ));
    gh.lazySingleton<_i20.NepseRepository>(() => _i20.NepseRepositoryImpl(
          gh<_i18.DataService>(),
          gh<_i9.NetworkInfo>(),
        ));
    gh.factory<_i21.RemoveFromWatchlistCubit>(
        () => _i21.RemoveFromWatchlistCubit(gh<_i19.LocalStockRepository>()));
    gh.lazySingleton<_i22.ShareListBloc>(() => _i22.ShareListBloc(
          gh<_i19.LocalStockRepository>(),
          gh<_i20.NepseRepository>(),
        ));
    gh.lazySingleton<_i23.AddStockCubit>(
        () => _i23.AddStockCubit(gh<_i19.LocalStockRepository>()));
    gh.lazySingleton<_i24.AddToWatchlistCubit>(
        () => _i24.AddToWatchlistCubit(gh<_i19.LocalStockRepository>()));
    gh.lazySingleton<_i25.DeleteStockCubit>(
        () => _i25.DeleteStockCubit(gh<_i19.LocalStockRepository>()));
    gh.lazySingleton<_i26.HomeBloc>(
        () => _i26.HomeBloc(gh<_i20.NepseRepository>()));
    gh.lazySingleton<_i27.LoadPortfolioCubit>(() => _i27.LoadPortfolioCubit(
          gh<_i19.LocalStockRepository>(),
          gh<_i17.CalculationRepository>(),
        ));
    gh.lazySingleton<_i28.LoadPortfolioStockListCubit>(() =>
        _i28.LoadPortfolioStockListCubit(gh<_i19.LocalStockRepository>()));
    gh.factory<_i29.LoadWatchlistCubit>(
        () => _i29.LoadWatchlistCubit(gh<_i19.LocalStockRepository>()));
    return this;
  }
}

class _$RegisterModules extends _i30.RegisterModules {}
