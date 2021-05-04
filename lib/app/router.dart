import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
import 'package:crice_hospital_app/ui/screens/drawer_view/drawer_view.dart';
import 'package:crice_hospital_app/ui/screens/login_screen/login_view.dart';
import 'package:crice_hospital_app/ui/screens/notification_screen/notification_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switch_view.dart';
import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_view.dart';

// @MaterialAutoRouter(
//   routes: [
//     MaterialRoute(page: DashboardView ,initial: true),
//     MaterialRoute(page: NotificationScreenView),
//     MaterialRoute(page: ReportView),
//     MaterialRoute(page: VisitScreenView,),
//   ],
// )
// class $Router {}

import 'package:flutter/material.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.DashboardRoute:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case routes.NotificationRoute:
      return MaterialPageRoute(builder: (context) => NotificationScreenView());
    case routes.ReportRoute:
      return MaterialPageRoute(builder: (context) => ReportView());
    case routes.VisitRoute:
      return MaterialPageRoute(builder: (context) => VisitScreenView());
    case routes.SettingRoute:
      return MaterialPageRoute(builder: (context) => SettingsView());
    case routes.SwitcherRoute:
      return MaterialPageRoute(builder: (context) => ScreenSwitchView());
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case routes.DrawerRoute:
      return MaterialPageRoute(builder: (context) => DrawerView());
      default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}