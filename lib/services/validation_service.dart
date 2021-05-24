import 'package:injectable/injectable.dart';

@lazySingleton
class ValidationService {
  bool checkEmail(String email) {
    return checkEmpty(email) && checkEmailPattern(email);
  }

  bool checkEmailPattern(String emailPattern) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            caseSensitive: true)
        .hasMatch(emailPattern);
  }

  bool checkEmpty(String empty) {
    return empty.isNotEmpty;
  }

  bool checkPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool passwordLength(String password) {
    return password.length >= 6;
  }

  bool phoneNumberLength(String phoneNumber) {
    return phoneNumber.length >= 11;
  }
}
