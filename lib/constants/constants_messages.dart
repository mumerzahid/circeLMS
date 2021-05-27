class ConstantsMessages {

  // Error Messages
  static final String emailEmpty = "Please enter your email";
  static final String emailInvalid = "Invalid email";
  static final String passwordEmpty = "Please enter your password";
  static final String passwordLength = "Password must contain at least 6 characters";
  static final String phoneNumberLength = "Phone number should be 11 character";


  //API
  static String   fBaseURL = "http://79.143.187.147:3000/";
  static String baseUrl ="http://79.143.187.147:3000/api/v1/geofence/";
  static String midPoint = "auth/";
  static String endLPoint="login";
  static String endRPoint = "reset_password";
  static String endSPoint = "settings";
  static String endVPoint ="visits";
    static String endDPoint = "dashboard";
  static String reportsEPoint ="http://79.143.187.147:3000/visits/hospital_facility_report_mob";
  static bool loginStatus = false;

  static String loginURL =   baseUrl + midPoint + endLPoint;
  static String resetURL =   baseUrl + midPoint + endRPoint;
  static String settingURL = baseUrl + midPoint + endSPoint;
  static String visitsURL =  baseUrl + endVPoint;
  static String dashBoardURL = baseUrl + endDPoint;
  static String reportsURL = reportsEPoint;
}
