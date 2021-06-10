import 'dart:ui';

import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/model/hospital_notification.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationScreenViewModel extends FutureViewModel {
  final Api _api = locator<Api>();
  String date;
  List<HospitalNotifications> notifications = new List();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool _loadingScreen = true;
  bool get loadingScreen => _loadingScreen;

  void errorListener(NotificationsModel notificationsModel) {
    if (notificationsModel.success) {
      notifications =
          notificationsModel.data.hospitalNotifications.reversed.toList();
      _loadingScreen = false;
      print(notifications);
      notifyListeners();
      print("Notifications Successfully");
    } else {
      _loadingScreen =false;
      snackBar(notificationsModel.message);
      notifyListeners();
    }
  }

  bool headerStatus(int index) {
    DateTime day1;
    DateTime day2;
    // String day = formatDate(dateTime, [yyyy,'-',mm,'-',dd]);
    if (index > 0) {
      int i = index - 1;
      day1 = DateTime.parse(notifications[index].createdAt);
      String d1 = formatDate(day1, [yyyy, '-', mm, '-', dd]);
      print("Day one " + d1);
      day2 = DateTime.parse(notifications[i].createdAt);
      String d2 = formatDate(day2, [yyyy, '-', mm, '-', dd]);
      print("Day two " + d2);

      if (d1 == d2) {
        print(index);
        return true;
      } else {
        print(index);
        return false;
      }
    } else {
      print(index);
      return false;
    }
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

  Color headerColor(String date) {
    DateTime checkedTime = DateTime.parse(date);
    DateTime currentTime = DateTime.now();

    if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month) &&
        (currentTime.day == checkedTime.day)) {
      return Color.fromRGBO(176, 220, 201, 1);
    } else if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month)) {
      if ((currentTime.day - checkedTime.day) == 1) {
        return Color.fromRGBO(151, 218, 248, 1);
      }
    } else {
      return Colors.grey;
    }
  }

  String checkDate(String dateString) {
    
    DateTime checkedTime = DateTime.parse(dateString);
    DateTime currentTime = DateTime.now();

    if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month) &&
        (currentTime.day == checkedTime.day)) {
      return "TODAY";
    } else if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month)) {
      if ((currentTime.day - checkedTime.day) == 1) {
        return "YESTERDAY";
      }
    } else {
      print(dateString);
      return dateString;
    }
  }

  @override
  Future futureToRun() {
    return _api.getNotifications().then((value) => {
          errorListener(value),
        });
  }
}
