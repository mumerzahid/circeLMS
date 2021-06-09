// import 'dart:io';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:crice_hospital_app/services/media_service.dart';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final LocalStorage localStorage = locator<LocalStorage>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void snackBar(String Error) {
    snackbarService.showCustomSnackBar(
      variant: SnackbarType.white,
      message: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: 'Undo',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }
//   // final MyNavigationService _navigationService =MyNavigationService();
//   final _navigationService = locator<NavigationService>();
//   final _mediaService = locator<MediaService>();
//   File _selectedImage;
//
//   bool get hasSelectedImage => _selectedImage != null;
//
//   File get selectedImage => _selectedImage;
//
//   Future<bool> navigation({bool success = true}) async {
//     _navigationService.navigateTo(routes.LoginRoute);
//   }
//   Future selectImage({@required bool fromGallery}) async {
//     _selectedImage =
//     await runBusyFuture(_mediaService.getImage(fromGallery: fromGallery));
//   }
}
