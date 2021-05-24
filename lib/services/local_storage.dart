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
  void saveAuthToken(String token) async {
    // var _preferences = await SharedPreferences.getInstance();
    preferences.setString(authToken, token);
  }

  getAuthToken() async {
    // var _preferences = await SharedPreferences.getInstance();
    return preferences.getString(authToken);
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