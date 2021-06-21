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

class SettingsViewModel extends BaseViewModel implements Initialisable {
  final localStorage = locator<LocalStorage>();
  final _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final ValidationService _validationService = locator<ValidationService>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Api _api = locator<Api>();

  String pass;
  String phone;
  String _numberError;
  String mobileNumber;

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

  void errorListener(Settings update)  {
    if (update.success) {
      print("Settings");
      // localStorage.saveMobNum(mobileController.text);
       // mobileController.text = mobileNumber;
      // print(mobileController.text);
      mobileNumber = LocalStorage.localStorage.getMobNum();
      mobileController.text =mobileNumber;
      snackBar("Updated successfully!");
      notifyListeners();
      // _localStorage.clearSharedPrefrences();
      // _navigationService.pushNamedAndRemoveUntil(routes.LoginRoute);
    } else {
      _passError = update.message;
      snackBar(_passError);
    }
    passwordController.clear();
    setIsLoading(false);
  }

  Future<bool> navigation({bool success = true}) async {
    _navigationService.navigateTo(routes.SettingRoute);
  }

  bool validationMethod(String password, String phoneNumber) {
    bool validPhoneNumber = true;
    bool validPassword = true;
    if (phoneNumber.isNotEmpty) {
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
    if ((password.isEmpty || password == null) &&
        (phoneNumber.isEmpty || phoneNumber == null)) {
      validPassword = false;
      snackBar("Please fill the given fields");
      return false;
    }
    if (validPhoneNumber == true && validPassword == true) {
      return true;
    } else {
      return false;
    }
  }

  void snackBar(String error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: error,
      duration: Duration(seconds: 1),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  void updation(String password, String phoneNumber) async {
    print(password);
    print(phoneNumber);
    setIsLoading(true);

    if (validationMethod(password, phoneNumber)) {
      localStorage.saveMobNum(phoneNumber);
      print(password);
      print(phoneNumber);
      Map<String, String> body = {
        'password': password,
        'phone_number': phoneNumber,
      };
      if (password.isEmpty || password == null) {
        body.remove('password');
      }
      else
        {
          body.remove('phone_number');
        }
      _api.updatePassword(body).then((value) => {
            errorListener(value),
          });
    } else {
      setIsLoading(false);
    }
  }

  @override
  void initialise() {
    mobileNumber = LocalStorage.localStorage.getMobNum();
    mobileController.text =mobileNumber;
    notifyListeners();
  }
}
