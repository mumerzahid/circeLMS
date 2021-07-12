  import 'package:crice_hospital_app/ui/screens/dashboard/dashboard_view.dart';
  import 'package:crice_hospital_app/ui/screens/drawer_view/drawer_view.dart';
  import 'package:crice_hospital_app/ui/screens/login_screen/login_view.dart';
  import 'package:crice_hospital_app/ui/screens/notification_screen/notification_screen_view.dart';
  import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
  import 'package:crice_hospital_app/ui/screens/report/report_viewmodel.dart';
  import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switch_view.dart';
  import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_view.dart';
  import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_view.dart';
  import 'package:crice_hospital_app/ui/screens/youtube_player/youtube_video_player_view.dart';
  import 'package:crice_hospital_app/ui/widgets/html_viewer.dart';
  import 'package:crice_hospital_app/ui/widgets/sample.dart';
  import 'package:flutter/material.dart';
  import 'package:crice_hospital_app/constants/route_path.dart' as routes;
  import 'package:crice_hospital_app/ui/screens/reset_password/reset_password_view.dart';
  import 'locator.dart';
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
        // return MaterialPageRoute(builder: (context) => DrawerView());
      case routes.ResetRoute:
        return MaterialPageRoute(builder: (context) => ResetView());
      case routes.HtmlRoute:
        return MaterialPageRoute(builder: (context) => HtmlViewer());
      case routes.YoutubeRoute:
        return MaterialPageRoute(builder: (context) =>  YoutubeView());
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
