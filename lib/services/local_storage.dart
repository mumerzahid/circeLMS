import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String IS_LOGIN = 'isLogin';
  final String authToken = "token";
  final String fcmToken ="token";
  // final String saveUserId = "userId";
  // String saveUserId =  "";
  void saveAuthToken(String token) async {
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setString(authToken, token);
  }

  getAuthToken() async {
    // var _preferences = await SharedPreferences.getInstance();
    return preferences.getString(authToken);
  }
  void saveFcmToken(String token) async {
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setString(fcmToken, token);
  }

  getFcmToken() async {
    // var _preferences = await SharedPreferences.getInstance();
    return preferences.getString(fcmToken);
  }

  removeAuthToken() async {
    // var _preferences = await SharedPreferences.getInstance();
    bool value = await preferences.clear();
    return value;
  }

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

}