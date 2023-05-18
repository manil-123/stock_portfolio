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
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i4;
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart' as _i8;
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart'
    as _i7;
import 'package:share_portfolio/repository/nepse_repo.dart' as _i6;
import 'package:share_portfolio/services/data_service.dart' as _i5;
import 'package:share_portfolio/services/scrapper.dart' as _i3;

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
    gh.lazySingleton<_i3.Scrapper>(() => _i3.Scrapper());
    gh.lazySingleton<_i4.ShareInfoListDAO>(() => _i4.ShareInfoListDAO());
    gh.lazySingleton<_i5.DataService>(
        () => _i5.DataService(gh<_i3.Scrapper>()));
    gh.lazySingleton<_i6.NepseRepository>(
        () => _i6.NepseRepositoryImpl(gh<_i5.DataService>()));
    gh.lazySingleton<_i7.ShareListBloc>(() => _i7.ShareListBloc(
          gh<_i4.ShareInfoListDAO>(),
          gh<_i6.NepseRepository>(),
        ));
    gh.lazySingleton<_i8.HomeBloc>(
        () => _i8.HomeBloc(gh<_i6.NepseRepository>()));
    return this;
  }
}