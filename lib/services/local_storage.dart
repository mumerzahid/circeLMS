import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

@lazySingleton
class LocalStorage {
  static final LocalStorage localStorage = LocalStorage._internal();
  SharedPreferences preferences;
  factory LocalStorage() {
    return localStorage;
  }

  LocalStorage._internal();

  LocalStorage._();

  init() async {
    preferences = await SharedPreferences.getInstance();
  }
  String mobileNumberKey = "MobileNumberKey"; //" +00 000 00000";
  String IS_LOGIN = 'isLogin';
  final String authToken = "token";
  final String fcmToken ="token";
  bool isMobile ;
  // final String saveUserId = "userId";
  // String saveUserId =  "";
  void saveAuthToken(String token) async {
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setString(authToken, token);
  }

  getAuthToken() async {
    return preferences.getString(authToken);
  }
  void saveFcmToken(String token) async {
    preferences.setString(fcmToken, token);
  }
  getFirebaseToken() async {
    firebaseToken = await FirebaseMessaging.instance.getToken();
    print("FireBaseToken "+firebaseToken);
    return firebaseToken;
  }

  void saveMobNum(String mob) async {
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setString(mobileNumberKey, mob);
  }
  String getMobNum() {
   return preferences.getString(mobileNumberKey)==null?" +00 000 00000":preferences.getString(mobileNumberKey);
   // print(preferences.getString(mobileNumberKey));
  }
  // getFcmToken() async {
  //   // var _preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(fcmToken);
  // }
  //
  // removeAuthToken() async {
  //   // var _preferences = await SharedPreferences.getInstance();
  //   bool value = await preferences.clear();
  //   return value;
  // }

  saveLoginStatus(bool isLogin)async{
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setBool(IS_LOGIN, isLogin);
  }
  saveUserID(int id){
    preferences.setInt('saveUserId', id);
    // print("SaveUSERID in Local:"+saveUserId);
  }

  getUserID() async{
    return preferences.getInt('saveUserId');
  }

  removeUserID() async {
    // var _preferences = await SharedPreferences.getInstance();
    bool userRemove = await preferences.clear();
    return userRemove;
  }

  bool getLoginStatus(){
    // var _preferences = await SharedPreferences.getInstance();
    // print(_preferences.getBool(IS_LOGIN));
    return preferences.getBool(IS_LOGIN) == null ? false : preferences.getBool(IS_LOGIN);
  }

  Future<bool> clearSharedPrefrences()async{
    // var _preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }

  setDeviceType(BuildContext context){
    double deviceWidth = MediaQuery.of(context).size.width;
    isMobile = deviceWidth < 600;
    preferences.setBool('isMobile', isMobile);
    // return MediaQuery.of(context).size.width < 600;
  }

  bool getDeviceType(){
    // print(preferences.getBool('key'))
    return preferences.getBool('isMobile');
  }

}