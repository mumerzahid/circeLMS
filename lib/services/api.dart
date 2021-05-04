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
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/user.dart';
import 'package:injectable/injectable.dart';
// import 'package:my_app_flutter/model/login_model.dart';
// import 'package:my_app_flutter/services/api_service/api_service.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
@lazySingleton
class Api {
  var client = Client();

  @override
  Future<UserLogin> login(Map<String, String> body) async {
    final response = await client.post(Uri.parse(ConstantsMessages.loginURL), body: body);
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      // If the call to the server was successful, parse the JSON
      return UserLogin.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      if (response.body != null)
        return UserLogin.fromJson(json.decode(response.body));
      else
        throw Exception(response.reasonPhrase);
    }
  }
}