// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'http/http.dart' as _i4;
import 'injection_modules.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injactableModule = _$InjactableModule();
  gh.lazySingleton<_i3.Client>(() => injactableModule.client);
  gh.lazySingleton<_i4.HttpAgent>(
      () => _i4.HttpAgent(client: get<_i3.Client>()));
  return get;
}

class _$InjactableModule extends _i5.InjactableModule {}
