

import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/media_service.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'locator.config.dart';

final locator = GetIt.instance;
@injectableInit
void setupLocator() => $initGetIt(locator);
// void setupLocator() {
//   locator.registerSingleton(()=> NavigationService());
//   locator.registerSingleton(()=> SnackbarService());
//   // locator.registerLazySingleton(() => MyNavigationService());
//   locator.registerLazySingleton(() => MediaService());
//   locator.registerLazySingleton(() => ValidationService());
//   locator.registerLazySingleton(() => Api());
// }