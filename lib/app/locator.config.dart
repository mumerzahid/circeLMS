// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../services/api.dart' as _i3;
import '../services/local_storage.dart' as _i5;
import '../services/third_party_services.dart' as _i7;
import '../services/validation_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServices = _$ThirdPartyServices();
  gh.lazySingleton<_i3.Api>(() => _i3.Api());
  gh.lazySingleton<_i4.DialogService>(() => thirdPartyServices.dialogService);
  gh.lazySingleton<_i5.LocalStorage>(() => _i5.LocalStorage());
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServices.navigationService);
  gh.lazySingleton<_i4.SnackbarService>(
      () => thirdPartyServices.snackbarService);
  gh.lazySingleton<_i6.ValidationService>(() => _i6.ValidationService());
  return get;
}

class _$ThirdPartyServices extends _i7.ThirdPartyServices {
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackbarService => _i4.SnackbarService();
}
