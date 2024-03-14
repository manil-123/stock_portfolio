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
    as _i3;
import 'package:share_portfolio/app/database/local_stock_dao.dart' as _i6;
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i9;
import 'package:share_portfolio/app/database/stock_watchlist_dao.dart' as _i10;
import 'package:share_portfolio/blocs/auth/auth_bloc.dart' as _i11;
import 'package:share_portfolio/blocs/home/home_bloc.dart' as _i21;
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart'
    as _i18;
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart'
    as _i20;
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart'
    as _i4;
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart'
    as _i22;
import 'package:share_portfolio/blocs/portfolio/load_portfolio_stock_list/load_portfolio_stock_list_cubit.dart'
    as _i23;
import 'package:share_portfolio/blocs/share_list/share_list_bloc.dart' as _i17;
import 'package:share_portfolio/blocs/watchlist/add_to_watchlist/add_to_watchlist_cubit.dart'
    as _i19;
import 'package:share_portfolio/blocs/watchlist/load_watchlist/load_watchlist_cubit.dart'
    as _i24;
import 'package:share_portfolio/blocs/watchlist/remove_from_watchlist/remove_from_watchlist_cubit.dart'
    as _i16;
import 'package:share_portfolio/core/di/register_modules.dart' as _i25;
import 'package:share_portfolio/core/network/network_info.dart' as _i7;
import 'package:share_portfolio/repository/calculation_repo.dart' as _i12;
import 'package:share_portfolio/repository/local_stock_repository.dart' as _i14;
import 'package:share_portfolio/repository/nepse_repository.dart' as _i15;
import 'package:share_portfolio/services/data_service.dart' as _i13;
import 'package:share_portfolio/services/local_auth_service.dart' as _i5;
import 'package:share_portfolio/services/scrapper.dart' as _i8;

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
    gh.lazySingleton<_i3.InternetConnectionChecker>(
        () => registerModules.connectionChecker);
    gh.factory<_i4.LoadAddStockCubit>(() => _i4.LoadAddStockCubit());
    gh.lazySingleton<_i5.LocalAuthService>(() => _i5.LocalAuthService());
    gh.lazySingleton<_i6.LocalStockListDAO>(() => _i6.LocalStockListDAO());
    gh.lazySingleton<_i7.NetworkInfo>(
        () => _i7.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
    gh.lazySingleton<_i8.Scrapper>(() => _i8.Scrapper());
    gh.lazySingleton<_i9.ShareInfoListDAO>(() => _i9.ShareInfoListDAO());
    gh.lazySingleton<_i10.StockWatchlistDAO>(() => _i10.StockWatchlistDAO());
    gh.lazySingleton<_i11.AuthBloc>(
        () => _i11.AuthBloc(gh<_i5.LocalAuthService>()));
    gh.lazySingleton<_i12.CalculationRepository>(
        () => _i12.CalculationRepositoryImpl(
              shareInfoListDAO: gh<_i9.ShareInfoListDAO>(),
              localStockListDAO: gh<_i6.LocalStockListDAO>(),
            ));
    gh.lazySingleton<_i13.DataService>(
        () => _i13.DataService(gh<_i8.Scrapper>()));
    gh.lazySingleton<_i14.LocalStockRepository>(
        () => _i14.LocalStockRepositoryImpl(
              gh<_i6.LocalStockListDAO>(),
              gh<_i10.StockWatchlistDAO>(),
              gh<_i9.ShareInfoListDAO>(),
            ));
    gh.lazySingleton<_i15.NepseRepository>(() => _i15.NepseRepositoryImpl(
          gh<_i13.DataService>(),
          gh<_i7.NetworkInfo>(),
        ));
    gh.factory<_i16.RemoveFromWatchlistCubit>(
        () => _i16.RemoveFromWatchlistCubit(gh<_i14.LocalStockRepository>()));
    gh.lazySingleton<_i17.ShareListBloc>(() => _i17.ShareListBloc(
          gh<_i14.LocalStockRepository>(),
          gh<_i15.NepseRepository>(),
        ));
    gh.lazySingleton<_i18.AddStockCubit>(
        () => _i18.AddStockCubit(gh<_i14.LocalStockRepository>()));
    gh.lazySingleton<_i19.AddToWatchlistCubit>(
        () => _i19.AddToWatchlistCubit(gh<_i14.LocalStockRepository>()));
    gh.lazySingleton<_i20.DeleteStockCubit>(
        () => _i20.DeleteStockCubit(gh<_i14.LocalStockRepository>()));
    gh.lazySingleton<_i21.HomeBloc>(
        () => _i21.HomeBloc(gh<_i15.NepseRepository>()));
    gh.lazySingleton<_i22.LoadPortfolioCubit>(() => _i22.LoadPortfolioCubit(
          gh<_i14.LocalStockRepository>(),
          gh<_i12.CalculationRepository>(),
        ));
    gh.lazySingleton<_i23.LoadPortfolioStockListCubit>(() =>
        _i23.LoadPortfolioStockListCubit(gh<_i14.LocalStockRepository>()));
    gh.factory<_i24.LoadWatchlistCubit>(
        () => _i24.LoadWatchlistCubit(gh<_i14.LocalStockRepository>()));
    return this;
  }
}

class _$RegisterModules extends _i25.RegisterModules {}
