import 'dart:ui';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/model/hospital_notification.dart';
import 'package:crice_hospital_app/model/qr_codes.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:stacked_services/stacked_services.dart';

class QrCodeScreenViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final Api _api = locator<Api>();
  List<Qrcodes> qrCodeList = new List();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool _loadingScreen = true;
  bool get loadingScreen => _loadingScreen;

  void errorListener(QrCodesModel qrCodesModel) {
    if (qrCodesModel.success) {
      qrCodeList =
          qrCodesModel.data.qrcodes;
      // qrCodeList.data.hospitalNotifications.reversed.toList();
      _loadingScreen = false;
      // print(notifications[1].createdAt);
      notifyListeners();
      print("QR Code Successfully");
    } else {
      _loadingScreen =false;
      // snackBar(notificationsModel.message);
      notifyListeners();
    }
  }

  // bool headerStatus(int index) {
  //   DateTime day1;
  //   DateTime day2;
  //   // String day = formatDate(dateTime, [yyyy,'-',mm,'-',dd]);
  //   if (index > 0) {
  //     int i = index - 1;
  //     day1 = DateTime.parse(notifications[i].createdAt).toLocal();
  //     print(day1);
  //     String d1 = formatDate(day1, [yyyy, '-', mm, '-', dd]);
  //     print("Day one " + d1);
  //     day2 = DateTime.parse(notifications[index].createdAt).toLocal();
  //     String d2 = formatDate(day2, [yyyy, '-', mm, '-', dd]);
  //     print("Day two " + d2);
  //
  //     if (d1 == d2) {
  //       print(index);
  //       return true;
  //     } else {
  //       print(index);
  //       return false;
  //     }
  //   } else {
  //     print(index);
  //     return false;
  //   }
  // }
  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('Snackbar Tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }
  // Color borderColor(index) {
  //   qrCodeList[index]
  //       .visitStatus == "Checkin" &&
  //       qrCodeList[index].level ==
  //           "Level 1" || qrCodeList[index]
  //       .visitStatus == "Checkout" &&
  //       qrCodeList[index].level ==
  //           "Level 1"? Color.fromRGBO(
  //       255, 255, 255, 1) : qrCodeList[index].visitStatus ==
  //       "Checkin" && qrCodeList[index].level ==
  //           "Level 2" || qrCodeList[index]
  //       .visitStatus == "Checkout" &&
  //       qrCodeList[index].level ==
  //           "Level 2"? Color.fromRGBO(
  //       199, 233, 251, 1) : qrCodeList[index].visitStatus ==
  //       "Checkin" &&
  //      qrCodeList[index].level ==
  //           "Level 3" || qrCodeList[index]
  //       .visitStatus == "Checkout" && qrCodeList[index].level ==
  //           "Level 3"? Color.fromRGBO(
  //       145, 204, 181, 1):Color.fromRGBO(
  //       255, 255, 255, 1);
  // }

  Future<bool> navigation({bool success = true}) async {
    _navigationService.navigateTo(routes.QrRoute);
  }

  @override
  Future futureToRun() {
    return _api.QRCode().then((value) => {
          errorListener(value),
        });
  }
}

// model.loadingScreen ? Center(
// child: CircularProgressIndicator(),
// ) : model.qrCodeList.isEmpty ||
// model.qrCodeList.length == null
// ? RefreshIndicator(
// onRefresh: model.futureToRun,
// child:
// ListView(scrollDirection: Axis.vertical, children: <Widget>[
// Padding(
// padding: EdgeInsets.only(
// top: MediaQuery
//     .of(context)
// .size
//     .width * 0.5),
// child: Center(
// child: Text(
// "No QR Codes now!",
// style: TextStyle(
// fontFamily: 'Open Sans',
// fontWeight: FontWeight.w700,
// fontSize: 16,
// color: const Color.fromRGBO(107, 126, 130, 1),
// ),
// ),
// ),
//
// ),
// ]),
// )
// :
