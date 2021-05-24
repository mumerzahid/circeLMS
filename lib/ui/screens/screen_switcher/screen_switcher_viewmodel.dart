import 'package:stacked/stacked.dart';

class ScreenSwitcherViewModel extends BaseViewModel {
  bool loader =true;
  int indexPosition = 0;
  String currentScreen = "DASHBOARD";
  String valuePressedString = "DASHBOARD";
  void switchTabs(
    int index,
    String screenName,
  ) {
    print(int);
    indexPosition = index;
    print(index);
    currentScreen = screenName;
    print(screenName);
    valuePressedString = screenName;
    notifyListeners();
  }
}
