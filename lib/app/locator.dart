import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;
@injectableInit
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}