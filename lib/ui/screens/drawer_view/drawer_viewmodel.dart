// import 'dart:io';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:crice_hospital_app/services/media_service.dart';import 'package:stacked/stacked.dart';
// import 'package:crice_hospital_app/constants/route_path.dart' as routes;
// import 'package:stacked_services/stacked_services.dart';
//
// class DrawerViewModel extends BaseViewModel{
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
// }