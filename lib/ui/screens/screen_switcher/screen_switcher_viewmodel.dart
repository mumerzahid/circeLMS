import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@singleton
class ScreenSwitcherViewModel extends BaseViewModel {
  bool loader = true;
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

  void setIndex(
    int index,
    String screenName,
  ) {
    indexPosition = index;
    currentScreen = screenName;
    valuePressedString = screenName;
    print(indexPosition);
    print("index position updated");
    notifyListeners();
  }
}
