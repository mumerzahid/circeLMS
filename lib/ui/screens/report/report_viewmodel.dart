import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;

class ReportViewModel extends BaseViewModel {
  // final NavigationService _navigationService = locator<NavigationService>();
  //
  // Future<bool> navigation({bool success = true}) async {
  //   _navigationService.navigateTo(routes.ReportRoute);
  // }

  DateTime currentDate = DateTime.now();
  bool startDateBoolean = false, endDateBoolean = false;
  DateTime startDate, endDate;
  bool isEnabled = false;

  Future<void> selectStartDate(BuildContext context, bool isStartDate) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );

    print(pickedDate);
    if (pickedDate != null && pickedDate != currentDate) {
      if (isStartDate) {
        startDateBoolean = true;
        startDate = pickedDate;
      } else {
        endDateBoolean = true;
        endDate = pickedDate;
      }
      notifyListeners();
    }
  }

  void filterClick() {
    isEnabled = true;
    notifyListeners();
  }
}
