import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/user.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  // final MyNavigationService _navigationService = locator<MyNavigationService>();
  final _navigationService = locator<NavigationService>();
  final ValidationService _validationService = locator<ValidationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final Api _api = locator<Api>();

  String _emailError;

  String get emailError => _emailError;

  String _passError;

  String get passError => _passError;

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void errorListener(UserLogin loginModel) {
    if (loginModel.success) {
      print("Successfully");
      Fluttertoast.showToast(msg: loginModel.message);
      _navigationService.navigateTo(routes.SwitcherRoute);

    } else {
      _passError = loginModel.message;
      snackBar();
      // Fluttertoast.showToast(msg: passError + " Password");
      // _emailError = loginModel.message;
      // Fluttertoast.showToast(msg: emailError);
    }
    setIsLoading(false);
    emailController.clear();
    passwordController.clear();
  }

  Future<bool> navigation({bool success = true}) async {
    _navigationService.navigateTo(routes.LoginRoute);
  }

  bool validationMethod(String email, String password) {
    if (!_validationService.checkEmpty(email))
      _emailError = ConstantsMessages.emailEmpty;
    else if (!_validationService.checkEmailPattern(email))
      _emailError = ConstantsMessages.emailInvalid;
    else if (!_validationService.checkEmpty(password))
      _passError = ConstantsMessages.passwordEmpty;
    else if (!_validationService.passwordLength(password))
      _passError = ConstantsMessages.passwordLength;
    else {
      return true;
    }
    return false;
  }
  void snackBar(){
    _snackbarService.showSnackbar(
      message:" Password",
      title: 'The title',
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: 'Undo',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }


  void logIn(String email, String password) async {
    _passError = null;
    _emailError = null;
    setIsLoading(true);
    if (validationMethod(email, password)) {
      Map<String, String> body = {
        'email': email,
        'password': password,
      };
      _api.login(body).then((value) =>
      {
        errorListener(value),
      });
    } else {
      setIsLoading(false);
    }
  }
}
