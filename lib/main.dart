import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/services/navigation_service_dart.dart';
import 'package:crice_hospital_app/ui/screens/notification_screen/notification_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_view.dart';
import 'package:crice_hospital_app/ui/screens/report/report_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_view.dart';
import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_view.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/stepper.dart';
import 'package:flutter/material.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:crice_hospital_app/app/router.dart' as router;



void main() {
  setupLocator();
  runApp(MyApp());
}
Map<int, Color> color =
{
  50:Color.fromRGBO(134, 227, 220, .1),
  100:Color.fromRGBO(134, 227, 220, .2),
  200:Color.fromRGBO(134, 227, 220, .3),
  300:Color.fromRGBO(134, 227, 220, .4),
  400:Color.fromRGBO(134, 227, 220, .5),
  500:Color.fromRGBO(134, 227, 220, .6),
  600:Color.fromRGBO(134, 227, 220, .7),
  700:Color.fromRGBO(134, 227, 220, .8),
  800:Color.fromRGBO(134, 227, 220,.9),
  900:Color.fromRGBO(134, 227, 220, 1),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xff86E3DC,color);
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute: routes.SwitcherRoute,
      onGenerateRoute: router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      // home: ReportView(),
    );
  }
}
