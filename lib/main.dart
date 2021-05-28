import 'dart:async';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:crice_hospital_app/app/router.dart' as router;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:stacked_services/stacked_services.dart';
import 'services/snackbar.dart';

String token;
void main() async {
  setupLocator();
  MySnackBar();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.localStorage.init();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  // token = await locator<LocalStorage>().getAuthToken();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()
  ));
}

Map<int, Color> color = {
  50: Color.fromRGBO(134, 227, 220, .1),
  100: Color.fromRGBO(134, 227, 220, .2),
  200: Color.fromRGBO(134, 227, 220, .3),
  300: Color.fromRGBO(134, 227, 220, .4),
  400: Color.fromRGBO(134, 227, 220, .5),
  500: Color.fromRGBO(134, 227, 220, .6),
  600: Color.fromRGBO(134, 227, 220, .7),
  700: Color.fromRGBO(134, 227, 220, .8),
  800: Color.fromRGBO(134, 227, 220, .9),
  900: Color.fromRGBO(134, 227, 220, 1),
};

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            // color: Theme.of(context).primaryColor,
            child: Image.asset(
              'assets/images/splash_screen.gif',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      );
    // );
  }
  // @override
  // Widget build(BuildContext context) {
  //   MaterialColor colorCustom = MaterialColor(0xff86E3DC, color);
  //   print(ConstantsMessages.loginStatus);
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: ConstantsMessages.loginStatus
  //         ? routes.SwitcherRoute
  //         : routes.LoginRoute,
  //     onGenerateRoute: router.generateRoute,
  //     navigatorKey: StackedService.navigatorKey,
  //     theme: ThemeData(
  //       primarySwatch: colorCustom,
  //     ),
  //   );
  // }
  //
  // getLoginStatus() {
  //   ConstantsMessages.loginStatus = LocalStorage.localStorage.getLoginStatus();
  //   print("Login Status: " + ConstantsMessages.loginStatus.toString());
  // }

  void loadData() {
    Timer(Duration(milliseconds: 6500), () {
      navToDashboard();
    });
  }
  void navToDashboard() {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (c, a1, a2) => AfterSplash()),
            (Route<dynamic> route) => false);
  }
}
class AfterSplash extends StatefulWidget{
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    super.initState();
    getLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xff86E3DC, color);
    print(ConstantsMessages.loginStatus);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ConstantsMessages.loginStatus
          ? routes.SwitcherRoute
          : routes.LoginRoute,
      onGenerateRoute: router.generateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
    );
  }

  getLoginStatus() {
    ConstantsMessages.loginStatus = LocalStorage.localStorage.getLoginStatus();
    print("Login Status: " + ConstantsMessages.loginStatus.toString());
  }
}

// "http://schemas.android.com/apk/res/android"
