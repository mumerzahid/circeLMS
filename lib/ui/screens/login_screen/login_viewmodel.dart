import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/user.dart';
import 'package:crice_hospital_app/model/reset_password.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
// import 'package:crice_hospital_app/utils/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final MyNavigationService _navigationService = locator<MyNavigationService>();
  final _navigationService = locator<NavigationService>();
  final ValidationService _validationService = locator<ValidationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final LocalStorage _localStorage =locator<LocalStorage>();
  // LocalStorage localStorage = LocalStorage();


  final Api _api = locator<Api>();

  String _emailError;

  String get emailError => _emailError;

  String _passError;

  String get passError => _passError;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void obsecureValue(){
    _obsecureText = !_obsecureText;
    print(_obsecureText);
    notifyListeners();
  }

  void errorListener(User loginModel) {
    if (loginModel.success) {
      print("Successfully");
      _localStorage.saveAuthToken(loginModel.data.geofence.authToken);
      _localStorage.saveLoginStatus(true);
      print("Login Status Saved as: " + _localStorage.getLoginStatus().toString());
      _navigationService.pushNamedAndRemoveUntil(routes.SwitcherRoute);
      emailController.clear();
      passwordController.clear();
      setIsLoading(false);
      snackBar(loginModel.message);
      // Fluttertoast.showToast(msg: loginModel.message);
    }
    else
      {
        setIsLoading(false);
        emailController.clear();
        passwordController.clear();
      _passError = loginModel.message;
      _localStorage.saveLoginStatus(false);
      snackBar(_passError);
    }

  }



  Future<bool> navigation({bool success = true}) async {
    _navigationService.navigateTo(routes.SwitcherRoute);
  }

  bool validationMethod(String email, String password) {
    if (!_validationService.checkEmpty(email)) {
      _emailError = ConstantsMessages.emailEmpty;
      snackBar(_emailError);
    }
    else if (!_validationService.checkEmailPattern(email)) {
      _emailError = ConstantsMessages.emailInvalid;
      snackBar(_emailError);
    }
    else if (!_validationService.checkEmpty(password)) {
      _passError = ConstantsMessages.passwordEmpty;
      snackBar(_passError);
    }
    else if (!_validationService.passwordLength(password)) {
      _passError = ConstantsMessages.passwordLength;
      snackBar(_passError);
    }
    else {
      _localStorage.saveLoginStatus(true);
      return true;
    }
    return false;
  }

  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.white,
      message: Error,
      title: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: 'Undo',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }
  void toResetNav(){
    _navigationService.navigateTo(routes.ResetRoute);
  }
// void Dialog(){
//   _dialogService.showDialog(
//     title: 'Test Dialog Title',
//     description: 'Test Dialog Description',
//     dialogPlatform: DialogPlatform.Material,
//   );
// }
  void logIn(String email, String password) async {
    _passError = null;
    _emailError = null;
    setIsLoading(true);
    if (validationMethod(email, password)) {
      Map<String, String> body = {
        'email': email,
        'password': password,
      };
      _api.login(body).then((value) => {
        errorListener(value),

          });
    } else {
      setIsLoading(false);
    }
  }
}
