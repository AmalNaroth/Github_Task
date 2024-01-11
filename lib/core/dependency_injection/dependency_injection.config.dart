// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/github_task/application/home_screen/home_bloc.dart'
    as _i7;
import '../../features/github_task/application/repository_screen/repository_bloc.dart'
    as _i8;
import '../../features/github_task/domain/home_screen/home_screen_services.dart'
    as _i3;
import '../../features/github_task/domain/repository_screen/repository_services.dart'
    as _i5;
import '../../features/github_task/infrastructure/repository/home_screen_repository.dart'
    as _i4;
import '../../features/github_task/infrastructure/repository/repository_screen_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HomeScreenServices>(() => _i4.HomeScreenRepository());
  gh.lazySingleton<_i5.RepositoryServices>(
      () => _i6.RepositoryScreenRepository());
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc(
        get<_i3.HomeScreenServices>(),
        get<_i5.RepositoryServices>(),
      ));
  gh.factory<_i8.RepositoryBloc>(
      () => _i8.RepositoryBloc(get<_i5.RepositoryServices>()));
  return get;
}
