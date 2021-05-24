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

class ResetViewModel extends BaseViewModel {

  final Api _api = locator<Api>();
  final ValidationService _validationService = locator<ValidationService>();
  TextEditingController emailController = TextEditingController();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService navigationService = locator<NavigationService>();

  String _emailFError;

  String get emailFError => _emailFError;

  bool _isFLoading = true;

  bool get isLoading => _isFLoading;

  setIsLoading(bool isLoading) {
    _isFLoading = isLoading;
    notifyListeners();
  }

  bool validationMethod(String email) {
    if (!_validationService.checkEmpty(email))
      _emailFError = ConstantsMessages.emailEmpty;
    else if (!_validationService.checkEmailPattern(email))
      _emailFError = ConstantsMessages.emailInvalid;
    else {
      return true;
    }
    return false;
  }
  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
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

  void resetListner(PasswordReset reset) {
    if (reset.success) {
      print("Submit?");
      Fluttertoast.showToast(msg: reset.message);
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
    setIsLoading(true);
    if (validationMethod(email)) {
      Map<String, String> body = {
        'email': email,
      };
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
