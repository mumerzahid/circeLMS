// import 'dart:convert';
//
// // import 'package:dio/dio.dart';
// import 'package:crice_hospital_app/constants/constants_messages.dart';
// import 'package:http/http.dart' show client;
// class API {
//   static String baseURL = "http://api.navme.co.za/";
//   static String loginURL = baseURL + "login";
//   // static const endPoint = "https://jsonplaceholder.typicode.com";
//   // Dio _dio =Dio();
//
//   // @lazySingleton
//   //
//   // @override
//   // Future<LoginModel> login(Map<String, String> body) async {
//   // final response = await client.post(Constants.loginURL, body: body);
//   // print(response);
//   // if (response.statusCode == 200) {
//   // // If the call to the server was successful, parse the JSON
//   // return LoginModel.fromJson(json.decode(response.body));
//   // } else {
//   // // If that call was not successful, throw an error.
//   // if (response.body != null)
//   // return LoginModel.fromJson(json.decode(response.body));
//   // else
//   // throw Exception(response.reasonPhrase);
//   // }
//   // }
//
//
// // Future<dynamic> login(Map<String, String> body) async {
// //     // var body = jsonEncode({'email': email, 'password': password});
// //   final response = await client.post(ConstantsMessages, body: body);
// //     var header = {
// //       "Content-Type": "application/json",
// //     };
// //     Response res = await _dio.post(loginURL, data: formData);
// //
// //     var jsonObject = jsonDecode(res.data);
// //     print(jsonObject);
// //     var status = jsonObject['status_code'];
// //     // print(status);
// //
// //     return status;
// //   }
//
// }

import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/dashboard.dart';
import 'package:crice_hospital_app/model/hospital_notification.dart';
import 'package:crice_hospital_app/model/html.dart';
import 'package:crice_hospital_app/model/reset_password.dart';
import 'package:crice_hospital_app/model/settings.dart';
import 'package:crice_hospital_app/model/user.dart';
import 'package:crice_hospital_app/model/visits.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
// import 'package:my_app_flutter/model/login_model.dart';
// import 'package:my_app_flutter/services/api_service/api_service.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class Api {
  var client = Client();
  final LocalStorage _localStorage = locator<LocalStorage>();

  @override
  Future<User> login(Map<String, String> body) async {
    final response =
        await client.post(Uri.parse(ConstantsMessages.loginURL), body: body);

    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return User.fromJson(json.decode(response.body));
    } else {
      if (response.body != null)
        return User.fromJson(json.decode(response.body));
      else
        throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<PasswordReset> resetPassword(Map<String, String> body) async {
    final response =
        await client.post(Uri.parse(ConstantsMessages.resetURL), body: body);
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return PasswordReset.fromJson(json.decode(response.body));
    } else {
      if (response.body != null)
        return PasswordReset.fromJson(json.decode(response.body));
      else
        throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<Settings> updatePassword(Map<String, String> body) async {
    String token = await _localStorage.getAuthToken();
    print(token);
    var header = {'Auth-Token': token};
    final response = await client.post(Uri.parse(ConstantsMessages.settingURL),
        headers: header, body: body);
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return Settings.fromJson(json.decode(response.body));
    } else {
      if (response.body != null)
        return Settings.fromJson(json.decode(response.body));
      else
        throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<VisitModel> getVisits(body) async {
    String token = await _localStorage.getAuthToken();
    print(token);
    print("run again");
    var header = {'Auth-Token': token};
    // Uri uri = Uri.parse(ConstantsMessages.visitsURL);
    // final params = uri.replace(queryParameters: body);
    // final bodyjson = json.encode(params);
    final response = await client.get(
      Uri.parse(ConstantsMessages.visitsURL + "$body"),
      // bodyjson,
      headers: header,
    );
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);

      return VisitModel.fromJson(json.decode(response.body));
    } else {
      if (response.body != null)
        return VisitModel.fromJson(json.decode(response.body));
      else
        throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<DashboardModel> getDashboardData() async {
    DashboardModel dashboardModel = DashboardModel();

    String token = await _localStorage.getAuthToken();
    print(token);
    print("again");
    var header = {'Auth-Token': token};
    final response = await client.get(
      Uri.parse(ConstantsMessages.dashBoardURL),
      headers: header,
    );
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);

      dashboardModel = DashboardModel.fromJson(json.decode(response.body));
      // return DashboardModel.fromJson(json.decode(response.body));
    } else {
      if (response.body != null) {
        dashboardModel = DashboardModel.fromJson(json.decode(response.body));
        // return DashboardModel.fromJson(json.decode(response.body));
      } else {
        throw Exception(response.reasonPhrase);
      }
    }

    return dashboardModel;
  }

  // @override
  // Future<HTMLWeb> getReportsHTML(Map<String,String> bodyMap) async {
  //
  //   // int userId = await _localStorage.getUserID();
  //   // // print(token);
  //   // var header = {'id': userId};
  //   // Uri uri = Uri.parse(ConstantsMessages.reportsURL);
  //   // uri.replace(queryParameters: bodyMap);
  //   // final bodyjson = json.encode(bodyMap);
  //   final response = await client.get(Uri.parse(ConstantsMessages.reportsURL),
  //       // body: bodyMap,
  //       // headers: header
  //   );
  //   print(response);
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //
  //     var htmlWeb = HTMLWeb();
  //
  //     htmlWeb.htmlData = response.body;
  //     return htmlWeb;
  //   } else {
  //     if (response.body != null){
  //       var htmlWeb = HTMLWeb();
  //
  //       htmlWeb.htmlData = null;
  //       return htmlWeb;
  //     } else
  //       throw Exception(response.reasonPhrase);
  //   }
  // }

  @override
  Future fcmToken() async {
    String token = await _localStorage.getAuthToken();
    String firebaseToken = await LocalStorage.localStorage.getFirebaseToken();
    print("Firebase token from api:" + firebaseToken);
    // var body = firebaseToken;
    var header = {'Auth-Token': token};
    Map<String, String> body = {'fcm_token': firebaseToken};
    final response = await client.post(Uri.parse(ConstantsMessages.fcmToken),
        body: body, headers: header);

    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      if (response.body != null)
        return json.decode(response.body);
      else
        throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<NotificationsModel> getNotifications() async {
    HospitalNotifications dashboardModel = HospitalNotifications();
    String token = await _localStorage.getAuthToken();
    print(token);
    print("notifications");
    var header = {'Auth-Token': token};
    final response = await client.get(
      Uri.parse(ConstantsMessages.notificationsURL),
      headers: header,
    );
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);

      return NotificationsModel.fromJson(json.decode(response.body));
    } else {
      try {
        if (response.body != null)
          return NotificationsModel.fromJson(json.decode(response.body));
        else
          return null;
      } catch (e) {
        return null;
      }
    }
  }
  // @override
  // Future<DashboardModel> getDashboardData() async {
  //   DashboardModel dashboardModel = DashboardModel();
  //
  //   String token = await _localStorage.getAuthToken();
  //   print(token);
  //   print("again");
  //   var header = {'Auth-Token': token};
  //   final response = await client.get(
  //     Uri.parse(ConstantsMessages.dashBoardURL),
  //     headers: header,
  //   );
  //   print(response);
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //
  //     dashboardModel = DashboardModel.fromJson(json.decode(response.  body));
  //     // return DashboardModel.fromJson(json.decode(response.body));
  //   } else {
  //     if (response.body != null) {
  //       dashboardModel = DashboardModel.fromJson(json.decode(response.body));
  //       // return DashboardModel.fromJson(json.decode(response.body));
  //     }
  //     else {
  //       throw Exception(response.reasonPhrase);
  //     }
  //   }
  //
  //   return dashboardModel;
  // }
// Future downloadDocument(Dio dio, String url, String savePath) async {
  //   //get pdf from link
  //   try {
  //     Response response = await dio.get(
  //       url,
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status < 500;
  //           }),
  //     );
  //     //write in download folder
  //     File file = File(savePath);
  //     var raf = file.openSync(mode: FileMode.write);
  //     raf.writeFromSync(response.data);
  //     await raf.close();
  //     _dash.snackBar("Download Completed");
  //     print("File Downloaded");
  //
  //     // Fluttertoast.showToast(msg: "Downlaod Completed");
  //   } catch (e) {
  //     print("Error is");
  //     print(e);
  //   }
  // }

}
