// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:crice_hospital_app/model/settings.dart';
// import 'package:crice_hospital_app/services/validation_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:stacked/stacked.dart';
// import 'package:crice_hospital_app/constants/route_path.dart' as routes;
// import 'package:stacked_services/stacked_services.dart';
//
// class SettingsViewModel extends BaseViewModel{
//   final _navigationService = locator<NavigationService>();
// final ValidationService validationService = locator<ValidationService>();  // final MyNavigationService _navigationService =locator<MyNavigationService>();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   // String _passwordError;
//   // String get passwordError => _passwordError;
//
//   String _emailError;
//
//   String get emailError => _emailError;
//
//   String _passError;
//
//   String get passError => _passError;
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   bool _obscureText = true;
//   bool get obscureText=> _obscureText;
//
//
//
// setIsLoading(bool isLoading) {
//   _isLoading = isLoading;
//   notifyListeners();
// }
//
// void errorListener(Settings update) {
//   if (update.success) {
//     print("Successfully");
//     _navigationService.pushNamedAndRemoveUntil(routes.SwitcherRoute);
//     snackBar(update.message);
//     // Fluttertoast.showToast(msg: loginModel.message);
//   }
//   else
//   {
//     _passError = update.message;
//     snackBar(_passError);
//   }
//   mobileController.clear();
//   passwordController.clear();
//   setIsLoading(false);
// }
//
//
//
// Future<bool> navigation({bool success = true}) async {
//   _navigationService.navigateTo(routes.SwitcherRoute);
// }
//
// bool validationMethod(String email, String password) {
//   if (!_validationService.checkEmpty(email))
//     _emailError = ConstantsMessages.emailEmpty;
//   else if (!_validationService.checkEmailPattern(email))
//     _emailError = ConstantsMessages.emailInvalid;
//   else if (!_validationService.checkEmpty(password))
//     _passError = ConstantsMessages.passwordEmpty;
//   else if (!_validationService.passwordLength(password))
//     _passError = ConstantsMessages.passwordLength;
//   else {
//     return true;
//   }
//   return false;
// }
//
// void snackBar(String Error) {
//   _snackbarService.showCustomSnackBar(
//     variant: SnackbarType.white,
//     message: Error,
//     title: Error,
//     duration: Duration(seconds: 2),
//     onTap: (_) {
//       print('snackbar tapped');
//     },
//     mainButtonTitle: 'Undo',
//     onMainButtonTapped: () => print('Undo the action!'),
//   );
// }
// void toResetNav(){
//   _navigationService.navigateTo(routes.ResetRoute);
// }
// // void Dialog(){
// //   _dialogService.showDialog(
// //     title: 'Test Dialog Title',
// //     description: 'Test Dialog Description',
// //     dialogPlatform: DialogPlatform.Material,
// //   );
// // }
// void logIn(String email, String password) async {
//   _passError = null;
//   _emailError = null;
//   setIsLoading(true);
//   if (validationMethod(email, password)) {
//     Map<String, String> body = {
//       'email': email,
//       'password': password,
//     };
//     _api.login(body).then((value) => {
//       errorListener(value),
//     });
//   } else {
//     setIsLoading(false);
//   }
// }
//
//
// }

import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/settings.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _localStorage = locator<LocalStorage>();
  final _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ValidationService _validationService = locator<
      ValidationService>(); // final MyNavigationService _navigationService =locator<MyNavigationService>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Api _api = locator<Api>();

  String pass;
  String phone;
  String _numberError;

  String get numberError => _numberError;

  String _passError;

  String get passError => _passError;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  setIsObscureText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void errorListener(Settings update) {
    if (update.success) {
      print("Settings");
      _localStorage.clearSharedPrefrences();
      _navigationService.pushNamedAndRemoveUntil(routes.LoginRoute);
    } else {
      _passError = update.message;
      snackBar(_passError);
    }
    mobileController.clear();
    passwordController.clear();
    setIsLoading(false);
  }

  Future<bool> navigation({bool success = true}) async {
    _navigationService.navigateTo(routes.SettingRoute);
  }

  bool validationMethod(String password, String phoneNumber) {
    bool validPhoneNumber = true;
    bool validPassword = true;
    if(phoneNumber.isNotEmpty){
      if (!_validationService.phoneNumberLength(phoneNumber)) {
        _numberError = ConstantsMessages.phoneNumberLength;
        snackBar(_numberError);
        validPhoneNumber = false;
      }
    }

    if (password.isNotEmpty) {
      if (!_validationService.passwordLength(password)) {
        _passError = ConstantsMessages.passwordLength;
        snackBar(_passError);
        validPassword = false;
      }
    }
    if(validPhoneNumber == validPassword){
      return true;
    }else{
      return false;
    }
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

  void updation(String password, String phoneNumber) async {
    print(password);
    print(phoneNumber);
    setIsLoading(true);
    if (validationMethod(password, phoneNumber)) {
      print(password);
      print(phoneNumber);
      Map<String, String> body = {
        'password': password,
        'phone_number': phoneNumber,
      };
      if(password.isEmpty || password == null)
      body.remove('password');
      _api.updatePassword(body).then((value) => {
            errorListener(value),
          });
    } else {
      setIsLoading(false);
    }
  }
}