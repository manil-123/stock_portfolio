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
import 'package:share_portfolio/app/database/share_info_dao.dart' as _i7;
import 'package:share_portfolio/blocs/home_bloc/home_bloc.dart' as _i3;
import 'package:share_portfolio/blocs/share_list_bloc/share_list_bloc.dart'
    as _i6;
import 'package:share_portfolio/repository/nepse_repo.dart' as _i4;
import 'package:share_portfolio/services/data_service.dart' as _i8;
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
    gh.lazySingleton<_i3.HomeBloc>(
        () => _i3.HomeBloc(gh<_i4.NepseRepositoryImpl>()));
    gh.lazySingleton<_i5.Scrapper>(() => _i5.Scrapper());
    gh.lazySingleton<_i6.ShareListBloc>(() => _i6.ShareListBloc(
          gh<_i7.ShareInfoListDAO>(),
          gh<_i4.NepseRepositoryImpl>(),
        ));
    gh.lazySingleton<_i8.DataService>(
        () => _i8.DataService(gh<_i5.Scrapper>()));
    gh.lazySingleton<_i4.NepseRepoitory>(
        () => _i4.NepseRepositoryImpl(gh<_i8.DataService>()));
    return this;
  }
}
