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
import 'package:share_portfolio/app/database/local_stock_dao.dart' as _i4;
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i6;
import 'package:share_portfolio/blocs/auth_bloc/auth_bloc.dart' as _i7;
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart' as _i13;
import 'package:share_portfolio/blocs/portfolio/portfolio_bloc.dart' as _i11;
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart'
    as _i12;
import 'package:share_portfolio/repository/calculation_repo.dart' as _i8;
import 'package:share_portfolio/repository/nepse_repo.dart' as _i10;
import 'package:share_portfolio/services/data_service.dart' as _i9;
import 'package:share_portfolio/services/local_auth_service.dart' as _i3;
import 'package:share_portfolio/services/scrapper.dart' as _i5;

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
    gh.lazySingleton<_i3.LocalAuthService>(() => _i3.LocalAuthService());
    gh.lazySingleton<_i4.LocalStockListDAO>(() => _i4.LocalStockListDAO());
    gh.lazySingleton<_i5.Scrapper>(() => _i5.Scrapper());
    gh.lazySingleton<_i6.ShareInfoListDAO>(() => _i6.ShareInfoListDAO());
    gh.lazySingleton<_i7.AuthBloc>(
        () => _i7.AuthBloc(gh<_i3.LocalAuthService>()));
    gh.lazySingleton<_i8.CalculationRepository>(
        () => _i8.CalculationRepositoryImpl(
              shareInfoListDAO: gh<_i6.ShareInfoListDAO>(),
              localStockListDAO: gh<_i4.LocalStockListDAO>(),
            ));
    gh.lazySingleton<_i9.DataService>(
        () => _i9.DataService(gh<_i5.Scrapper>()));
    gh.lazySingleton<_i10.NepseRepository>(
        () => _i10.NepseRepositoryImpl(gh<_i9.DataService>()));
    gh.lazySingleton<_i11.PortfolioBloc>(() => _i11.PortfolioBloc(
          localStockListDAO: gh<_i4.LocalStockListDAO>(),
          calculationRepo: gh<_i8.CalculationRepository>(),
        ));
    gh.lazySingleton<_i12.ShareListBloc>(() => _i12.ShareListBloc(
          gh<_i6.ShareInfoListDAO>(),
          gh<_i10.NepseRepository>(),
        ));
    gh.lazySingleton<_i13.HomeBloc>(
        () => _i13.HomeBloc(gh<_i10.NepseRepository>()));
    return this;
  }
}
