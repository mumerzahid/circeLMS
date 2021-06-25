import 'dart:async';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/services/local_storage.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:crice_hospital_app/app/router.dart' as router;
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
import 'package:stacked_services/stacked_services.dart';
import 'services/snackbar.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
String firebaseToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  setupLocator();
  MySnackBar();
  // WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.localStorage.init();
  // await FlutterDownloader.initialize(

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
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
    super.initState();
    // _localStorage.getFirebaseToken();
    firebaseNotification();
    loadData();
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

  void loadData() {
    Timer(Duration(milliseconds: 5000), () {
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

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  final ScreenSwitcherViewModel _screenSwitcherViewModel =
      locator<ScreenSwitcherViewModel>();
  var notificationType;
  // final BehaviorSubject<ReceivedNotification>
  //     didReceiveLocalNotificationSubject =
  //     BehaviorSubject<ReceivedNotification>();
  @override
  void initState() {
    super.initState();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/launcher_icon");
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            // requestAlertPermission: true,
            // requestBadgePermission: false,
            // requestSoundPermission: true,
            // onDidReceiveLocalNotification:
            //     (int id, String title, String body, String payload) async {
            //   didReceiveLocalNotificationSubject.add(ReceivedNotification(
            //       id: id, title: title, body: body, payload: payload));
            // }
            );
    // var initializationSettingsIOS = IOSInitializationSettings(
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification
    // );
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['notification_type'] == '1' ||
          message.data['notification_type'] == 1) {
        _screenSwitcherViewModel.setIndex(2, "VISITS");
      } else if (message.data['notification_type'] == '2' ||
          message.data['notification_type'] == 2) {
        _screenSwitcherViewModel.setIndex(3, "NOTIFICATIONS");
      }
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        if (message.data['notification_type'] == '1' ||
            message.data['notification_type'] == 1) {
          _screenSwitcherViewModel.setIndex(2, "VISITS");
        } else if (message.data['notification_type'] == '2' ||
            message.data['notification_type'] == 2) {
          _screenSwitcherViewModel.setIndex(3, "NOTIFICATIONS");
        }
      }
    });
    getLoginStatus();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _initializeFlutterFire();
  }

  Future onSelectNotification(String payload) async {
    print(payload);
    print("on select called");
    int index = int.parse(payload);
    if (index == 1) {
      _screenSwitcherViewModel.setIndex(2, "VISITS");
    } else if (index == 2) {
      _screenSwitcherViewModel.setIndex(3, "NOTIFICATIONS");
    }
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xff86E3DC, color);
    print(ConstantsMessages.loginStatus);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ConstantsMessages.loginStatus
            ? routes.SwitcherRoute
            : routes.LoginRoute,
        onGenerateRoute: router.generateRoute,
        navigatorKey: StackedService.navigatorKey,
        theme: ThemeData(
          primarySwatch: colorCustom,
        ),
      ),
    );
  }

  getLoginStatus() {
    ConstantsMessages.loginStatus = LocalStorage.localStorage.getLoginStatus();
    print("Login Status: " + ConstantsMessages.loginStatus.toString());
  }
}

void firebaseNotification() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    if (notification != null) {
      _handleNotification(message);
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
void _handleNotification(RemoteMessage message) {
  var check = message.data["delete"] as String;
  if (check == "true") {
  } else {
    _showNotification(message.notification.title, message.notification.body,
        message.data['notification_type']);
  }
}

Future<void> _showNotification(String title, String body, data) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: true,
      playSound: true,
      ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
    //add ios
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: data);
}

// crashlytics
void _initializeFlutterFire() async {
  // Wait for Firebase to initialize

  if (kDebugMode) {
    // Force enable crashlytics collection enabled if we're testing it.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else {
    // Else only enable it in non-debug builds.
    // You could additionally extend this to allow users to opt-in.
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
}
//  Future<void> onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//   }

// class ReceivedNotification {
//   ReceivedNotification({
//     @required this.id,
//     @required this.title,
//     @required this.body,
//     @required this.payload,
//   });
//   final int id;
//   final String title;
//   final String body;
//   final String payload;
// }
