import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/model/html.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/html_viewer.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportViewModel extends BaseViewModel implements Initialisable{
  String html;
  String success;
  final Api _api = locator<Api>();
  final NavigationService navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final yesterday = DateTime.now().subtract(Duration(days: 1));

  DateTime todayDate;
  DateTime currentDate = DateTime.now();
  DateTime startDate  ;
  // = DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year);
  DateTime endDate;
  // = DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year);

  bool startDateBoolean = false, endDateBoolean = false;

  bool isEnabled = false;

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  @override
  void initialise() {
    startDate= yesterday;
    endDate = currentDate;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

// Date Picker also set the Start and End Date
  void selectStartDate(BuildContext context, bool isStartDate) async {
    DateTime pickedDate = await showDatePicker(

        context: context,
        initialDate:currentDate,
        firstDate: Jiffy().subtract(months: 3).dateTime,
        // DateTime.now().subtract(Duration()),
        lastDate: currentDate
    );

    if (pickedDate != null ) {
      if (isStartDate == true) {
        startDateBoolean = true;
        if(pickedDate.isAfter(endDate))
          {
            pickedDate =yesterday;
            endDate=currentDate;
            snackBar("Start date can not be greater than end date");
          }
        startDate = pickedDate;
        print(startDate);
      } else {
        endDateBoolean = true;
        if(pickedDate.isBefore(startDate))
          {
            pickedDate=currentDate;
            snackBar("End date can not be smaller than start date");
          }
        endDate = pickedDate;
      }
      notifyListeners();
    }
  }

  void filterClick() {
    isEnabled = true;
    notifyListeners();
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

  void errorListener(HTMLWeb web) {
    html = web.htmlData;
    setIsLoading(false);
    notifyListeners();
    navigationService.navigateToView(HtmlViewer(
      data: html,
    ));
  }

  void HtmlView(String start, String end) async {
    Map<String, String> body = {
      'start_date': start,
      'end_date': end,
    };
    _api.getReportsHTML(body).then((value) => {
          if (value != null) {
            errorListener(value)
          }
        });
  }


}
