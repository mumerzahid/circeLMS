import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel{
  // final MyNavigationService _navigationService =locator<MyNavigationService>();
  final _navigationService = locator<NavigationService>();
  String _passwordError;
  String get passwordError => _passwordError;

  bool _obscureText = true;
  bool get obscureText=> _obscureText;
  Future<bool> navigation({bool success = true}) async {

    _navigationService.navigateTo(routes.SettingRoute);

  }
//in-use

  setIsObscureText(bool obscureText){
    _obscureText = obscureText;
    notifyListeners();
  }
}