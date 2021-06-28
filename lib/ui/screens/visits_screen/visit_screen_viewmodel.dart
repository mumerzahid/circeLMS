import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/visits.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/services/validation_service.dart';
import 'package:date_format/date_format.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VisitScreenViewModel extends FutureViewModel {
  var apiReturn;
  final navigationService = locator<NavigationService>();
  final ValidationService _validationService = locator<ValidationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final Api api = locator<Api>();
  final LocalStorage _localStorage = locator<LocalStorage>();
  DateTime currentDate = DateTime.now();

  final Api _api = locator<Api>();
  List<Visits> visits = new List();
  var checkInDate;
  // List<Visits> arrayVisits = new List();

  // String _visitsModel;
  //
  // String get visitsModel => _visitsModel;

  String _emailError;

  String get emailError => _emailError;

  String _passError;

  String get passError => _passError;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool _screenLoading = true;

  bool get screenLoading => _screenLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void errorListener(VisitModel visit) {
    if (visit.success) {
      print("Successfully visit");

      visits = visit.data.visits;
      print(visits);
      _screenLoading =false;
      notifyListeners();
      setIsLoading(false);
    } else {
      _passError = visit.message;
      snackBar(_passError);
    }
    // emailController.clear();
    // passwordController.clear();
    setIsLoading(false);
    _screenLoading =false;
  }

  bool validationMethod(String email, String password) {
    if (!_validationService.checkEmpty(email)) {
      _emailError = ConstantsMessages.emailEmpty;
      snackBar(_emailError);
    } else if (!_validationService.checkEmailPattern(email)) {
      _emailError = ConstantsMessages.emailInvalid;
      snackBar(_emailError);
    } else if (!_validationService.checkEmpty(password)) {
      _passError = ConstantsMessages.passwordEmpty;
      snackBar(_passError);
    } else if (!_validationService.passwordLength(password)) {
      _passError = ConstantsMessages.passwordLength;
      snackBar(_passError);
    } else {
      return true;
    }
    return false;
  }

  void snackBar(String error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  @override
  Future futureToRun() {
    checkInDate = formatDate(currentDate, [dd, '/', mm, '/', yyyy]);
    notifyListeners();
    return _api.getVisits(checkInDate).then((value) => {
          errorListener(value),
        });
  }
}
