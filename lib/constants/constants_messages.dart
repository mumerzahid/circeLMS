import 'dart:io';

import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/local_storage.dart';

class ConstantsMessages {
  final LocalStorage localStorage = locator<LocalStorage>();
  // Error Messages
  static final String emailEmpty = "Please enter your email";
  static final String emailInvalid = "Invalid email";
  static final String passwordEmpty = "Please enter your password";
  static final String passwordLength =
      "Password must contain at least 6 characters";
  static final String phoneNumberLength = "Phone number should be 11 character";

  //API
  // static String   fBaseURL = "http://79.143.187.147:3000/";
  // static String baseUrl = "http://79.143.187.147:3000/api/v1/geofence/";
  static String fBaseURL = "https://cricecams.com/";
  static String baseUrl = "https://cricecams.com/api/v1/geofence/";
  static String midPoint = "auth/";
  static String endLPoint = "login";
  static String endRPoint = "reset_password";
  static String endSPoint = "settings";
  static String endVPoint = "visits";
  static String endDPoint = "dashboard";
  static String endQRPoint = "qrcodes";
  static String reportsEPoint =
      "https://cricecams.com/visits/hospital_facility_report_mob";
  // static String reportsEPoint =
  //     "http://79.143.187.147:3000/visits/hospital_facility_report_mob";
  static String fcmTokenPoints = "update_fcm_token";
  static String endNPoint = "geofence_notifications";
  static bool loginStatus = false;

  static String loginURL = baseUrl + midPoint + endLPoint;
  static String resetURL = baseUrl + midPoint + endRPoint;
  static String settingURL = baseUrl + midPoint + endSPoint;
  static String visitsURL = baseUrl + endVPoint + "?&&checkin_date=";
  static String dashBoardURL = baseUrl + endDPoint;
  static String reportsURL = reportsEPoint;
  static String qrCodeURL = baseUrl + endQRPoint;
  static String notificationsURL = baseUrl + endNPoint;
  static String fcmToken = baseUrl + midPoint + fcmTokenPoints;

  static double fontSmall = 9;
  static double fontMedium = 12;
  static double fontModerate = 13;
  static double fontLarge = 14;
  static double fontVeryLarge = 16;
  static double calenderSize = 18;
  static double screenName = 19;
// *4
  setFontSizes() {
    bool valueFont = localStorage.getDeviceType();
    if (Platform.isAndroid) {
      if (valueFont == false) {
        print("Android Tablet");
        fontSmall = 12;
        fontMedium = 14;
        fontModerate = 15;
        fontLarge = 17;
        fontVeryLarge = 19;
        calenderSize = 20;
        screenName = 21;
      }
    } else {
      if (valueFont == false) {
        print("IOS Tablet");
        fontSmall = 15;
        fontMedium = 17;
        fontModerate = 19;
        fontLarge = 21;
        fontVeryLarge = 23;
        calenderSize = 20;
        screenName = 20;
      } else {
        print("IOS Mobile");
        fontSmall = 10;
        fontMedium = 15;
        fontModerate = 15;
        fontLarge = 18;
        fontVeryLarge = 18;
        calenderSize = 20;
        screenName = 19;
      }
    }
  }
}
