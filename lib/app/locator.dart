

import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/media_service.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/services/third_party_services.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;
@injectableInit
void setupLocator(){

  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LocalStorage());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ValidationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerSingleton<ScreenSwitcherViewModel>(ScreenSwitcherViewModel());
}