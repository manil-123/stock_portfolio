// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:share_portfolio/app/database/local_stock_dao.dart' as _i5;
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i7;
import 'package:share_portfolio/blocs/auth/auth_bloc.dart' as _i9;
import 'package:share_portfolio/blocs/home/home_bloc.dart' as _i16;
import 'package:share_portfolio/blocs/portfolio/add_stock/add_stock_cubit.dart'
    as _i8;
import 'package:share_portfolio/blocs/portfolio/delete_stock/delete_stock_cubit.dart'
    as _i12;
import 'package:share_portfolio/blocs/portfolio/load_add_stocks/load_add_stock_cubit.dart'
    as _i3;
import 'package:share_portfolio/blocs/portfolio/load_portfolio/load_portfolio_cubit.dart'
    as _i13;
import 'package:share_portfolio/blocs/share_list/share_list_bloc.dart' as _i15;
import 'package:share_portfolio/repository/calculation_repo.dart' as _i10;
import 'package:share_portfolio/repository/nepse_repository.dart' as _i14;
import 'package:share_portfolio/services/data_service.dart' as _i11;
import 'package:share_portfolio/services/local_auth_service.dart' as _i4;
import 'package:share_portfolio/services/scrapper.dart' as _i6;

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
    gh.factory<_i3.LoadAddStockCubit>(() => _i3.LoadAddStockCubit());
    gh.lazySingleton<_i4.LocalAuthService>(() => _i4.LocalAuthService());
    gh.lazySingleton<_i5.LocalStockListDAO>(() => _i5.LocalStockListDAO());
    gh.lazySingleton<_i6.Scrapper>(() => _i6.Scrapper());
    gh.lazySingleton<_i7.ShareInfoListDAO>(() => _i7.ShareInfoListDAO());
    gh.lazySingleton<_i8.AddStockCubit>(
        () => _i8.AddStockCubit(gh<_i5.LocalStockListDAO>()));
    gh.lazySingleton<_i9.AuthBloc>(
        () => _i9.AuthBloc(gh<_i4.LocalAuthService>()));
    gh.lazySingleton<_i10.CalculationRepository>(
        () => _i10.CalculationRepositoryImpl(
              shareInfoListDAO: gh<_i7.ShareInfoListDAO>(),
              localStockListDAO: gh<_i5.LocalStockListDAO>(),
            ));
    gh.lazySingleton<_i11.DataService>(
        () => _i11.DataService(gh<_i6.Scrapper>()));
    gh.lazySingleton<_i12.DeleteStockCubit>(
        () => _i12.DeleteStockCubit(gh<_i5.LocalStockListDAO>()));
    gh.lazySingleton<_i13.LoadPortfolioCubit>(() => _i13.LoadPortfolioCubit(
          gh<_i5.LocalStockListDAO>(),
          gh<_i10.CalculationRepository>(),
        ));
    gh.lazySingleton<_i14.NepseRepository>(
        () => _i14.NepseRepositoryImpl(gh<_i11.DataService>()));
    gh.lazySingleton<_i15.ShareListBloc>(() => _i15.ShareListBloc(
          gh<_i7.ShareInfoListDAO>(),
          gh<_i14.NepseRepository>(),
        ));
    gh.lazySingleton<_i16.HomeBloc>(
        () => _i16.HomeBloc(gh<_i14.NepseRepository>()));
    return this;
  }
}
