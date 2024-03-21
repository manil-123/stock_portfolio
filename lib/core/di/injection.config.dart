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
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart' as _i12;
import 'package:share_portfolio/blocs/auth/auth_bloc.dart' as _i13;
import 'package:share_portfolio/blocs/home/home_bloc.dart' as _i23;
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart'
    as _i20;
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart'
    as _i22;
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart'
    as _i5;
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart'
    as _i24;
import 'package:share_portfolio/blocs/portfolio/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart'
    as _i25;
import 'package:share_portfolio/blocs/share_list/share_list_bloc.dart' as _i19;
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart'
    as _i21;
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart'
    as _i26;
import 'package:share_portfolio/blocs/watchlist/remove_from_watchlist/remove_from_watchlist_cubit.dart'
    as _i18;
import 'package:share_portfolio/core/database/dao/nepse_dao.dart' as _i8;
import 'package:share_portfolio/core/database/db/app_db.dart' as _i3;
import 'package:share_portfolio/core/di/register_modules.dart' as _i27;
import 'package:share_portfolio/core/network/network_info.dart' as _i9;
import 'package:share_portfolio/repository/calculation_repo.dart' as _i14;
import 'package:share_portfolio/repository/local_stock_repository.dart' as _i16;
import 'package:share_portfolio/repository/nepse_repository.dart' as _i17;
import 'package:share_portfolio/services/data_service.dart' as _i15;
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
    gh.lazySingleton<_i8.NepseDao>(() => _i8.NepseDao(gh<_i3.AppDB>()));
    gh.lazySingleton<_i9.NetworkInfo>(
        () => _i9.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
    gh.lazySingleton<_i10.Scrapper>(() => _i10.Scrapper());
    gh.lazySingleton<_i11.ShareInfoListDAO>(() => _i11.ShareInfoListDAO());
    gh.lazySingleton<_i12.StockWatchlistDAO>(() => _i12.StockWatchlistDAO());
    gh.lazySingleton<_i13.AuthBloc>(
        () => _i13.AuthBloc(gh<_i6.LocalAuthService>()));
    gh.lazySingleton<_i14.CalculationRepository>(
        () => _i14.CalculationRepositoryImpl(
              shareInfoListDAO: gh<_i11.ShareInfoListDAO>(),
              localStockListDAO: gh<_i7.LocalStockListDAO>(),
            ));
    gh.lazySingleton<_i15.DataService>(
        () => _i15.DataService(gh<_i10.Scrapper>()));
    gh.lazySingleton<_i16.LocalStockRepository>(
        () => _i16.LocalStockRepositoryImpl(
              gh<_i7.LocalStockListDAO>(),
              gh<_i12.StockWatchlistDAO>(),
              gh<_i11.ShareInfoListDAO>(),
            ));
    gh.lazySingleton<_i17.NepseRepository>(() => _i17.NepseRepositoryImpl(
          gh<_i15.DataService>(),
          gh<_i9.NetworkInfo>(),
        ));
    gh.factory<_i18.RemoveFromWatchlistCubit>(
        () => _i18.RemoveFromWatchlistCubit(gh<_i16.LocalStockRepository>()));
    gh.lazySingleton<_i19.ShareListBloc>(() => _i19.ShareListBloc(
          gh<_i16.LocalStockRepository>(),
          gh<_i17.NepseRepository>(),
        ));
    gh.lazySingleton<_i20.AddStockCubit>(
        () => _i20.AddStockCubit(gh<_i16.LocalStockRepository>()));
    gh.lazySingleton<_i21.AddToWatchlistCubit>(
        () => _i21.AddToWatchlistCubit(gh<_i16.LocalStockRepository>()));
    gh.lazySingleton<_i22.DeleteStockCubit>(
        () => _i22.DeleteStockCubit(gh<_i16.LocalStockRepository>()));
    gh.lazySingleton<_i23.HomeBloc>(
        () => _i23.HomeBloc(gh<_i17.NepseRepository>()));
    gh.lazySingleton<_i24.LoadPortfolioCubit>(() => _i24.LoadPortfolioCubit(
          gh<_i16.LocalStockRepository>(),
          gh<_i14.CalculationRepository>(),
        ));
    gh.lazySingleton<_i25.LoadPortfolioStockListCubit>(() =>
        _i25.LoadPortfolioStockListCubit(gh<_i16.LocalStockRepository>()));
    gh.factory<_i26.LoadWatchlistCubit>(
        () => _i26.LoadWatchlistCubit(gh<_i16.LocalStockRepository>()));
    return this;
  }
}

class _$RegisterModules extends _i27.RegisterModules {}
