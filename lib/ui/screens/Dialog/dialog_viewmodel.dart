import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/reset_password.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogViewModel extends BaseViewModel{

  final Api _api = locator<Api>();
  final ValidationService _validationService = locator<ValidationService>();
  TextEditingController emailController = TextEditingController();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService navigationService = locator<NavigationService>();

  String _emailFError;
  String get emailFError => _emailFError;

  bool _isFLoading = false;
  bool get isLoading => _isFLoading;

  bool _email = true;
  bool get getVerifiedemail => _email;

  setIsLoading(bool isLoading) {
    _isFLoading = isLoading;
    notifyListeners();
  }


  bool isEmail(String string) {
    const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regExp = RegExp(pattern,caseSensitive: true);

    if (!regExp.hasMatch(string)) {
      print("Print False");
      _email= false;
    }
    print("Print False");
    if(regExp.hasMatch(string) || (string.isEmpty || string == null ))
      _email = true;
    notifyListeners();
  }

  bool validationMethod(String email) {
    if (!_validationService.checkEmpty(email))
      {
      _emailFError = ConstantsMessages.emailEmpty;
    snackBar("Please enter email");
       }
    else {
      return true;
    }
    return false;
  }
  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  void resetListner(PasswordReset reset) {
    if (reset.success) {
      print("Submit?");
      navigationService.popRepeated(1);
      snackBar(reset.message);
      print(reset.message);
    }
    else
    {
      _emailFError = reset.message;
      snackBar(_emailFError);
    }
    emailController.clear();
    setIsLoading(false);
  }
  void resetPassword(String email) async {
    _emailFError = null;
    if (validationMethod(email)) {
      Map<String, String> body = {
        'email': email,
      };
      setIsLoading(true);
      _api.resetPassword(body).then((value) =>
      {
        resetListner(value),
      });
      // } else {
      //   setIsLoading(false);
      // }
    }
  }
}