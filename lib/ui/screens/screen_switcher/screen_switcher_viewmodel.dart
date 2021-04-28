import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;

class ScreenSwitcherViewModel extends BaseViewModel {
  int indexPosition = 0;
  String currentScreen = "DASHBOARD";
  String valuePressedString = "DASHBOARD";
  void switchTabs(
    int index,
    String screenName,
  ) {
    print(int);
    indexPosition = index;
    currentScreen = screenName;
    valuePressedString = screenName;
    notifyListeners();
  }
}
