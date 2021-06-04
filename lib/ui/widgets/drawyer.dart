// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:nutri_bar/app/locator.dart';
// import 'package:nutri_bar/app/router.dart' as router;
// import 'package:nutri_bar/utils/paths.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'app/snack_bar_style_ui.dart';
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
// AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//   setupLocator();
//   setupSnackbarUi();
//   runApp(MyApp());
// }
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   @override
//   void initState() {
//     initNotification();
//     getToken();
//     firebaseNotification();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       debugShowCheckedModeBanner: false,
//       initialRoute: Paths.splashScreen,
//       onGenerateRoute: router.generateRoute,
//       navigatorKey: StackedService.navigatorKey,
//       theme: ThemeData(
//         primaryColor: Color(0xff413A34),
//         fontFamily: "Gotham",
//       ),
//     );
//   }
//   void firebaseNotification() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification notification = message.notification;
//       AndroidNotification android = message.notification?.android;
//       if (notification != null) {
//         _handleNotification(message);
//       }
//     });
//   }
//   getToken() async {
//     String token = await FirebaseMessaging.instance.getToken();
//     print(token);
//   }
// }
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
// Future<void> initNotification() async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   var initializationSettingsAndroid = AndroidInitializationSettings("@mipmap/launcher_icon");
//   var initializationSettingsIOS = IOSInitializationSettings();
//   var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
// void _handleNotification(RemoteMessage message) {
//   var check = message.data["delete"] as String;
//   if (check == "true") {
//   } else {
//     _showNotification(
//         message.notification.title,message.notification.body);
//   }
// }
// Future<void> _showNotification(String title, String body) async {
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.max, priority: Priority.high, ticker: 'ticker');
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin
//       .show(0, title, body, platformChannelSpecifics, payload: 'item x');
// }
// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:crice_hospital_app/constants/constants_messages.dart';
// import 'package:crice_hospital_app/constants/route_path.dart';
// import 'package:crice_hospital_app/services/local_storage.dart';
// import 'package:crice_hospital_app/ui/screens/login_screen/login_viewmodel.dart';
// import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_viewmodel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// class MyCustomDrawer extends StatelessWidget {
//   bool loader = false;
//   @override
//   Widget build(BuildContext context) {
//     final NavigationService _navigationService = locator<NavigationService>();
//     final LocalStorage _localStorage = LocalStorage();
//     return SafeArea(
//       child: loader?Center(
//         child: CircularProgressIndicator(),
//       ):Container(
//         width: MediaQuery.of(context).size.width,
//         child: Drawer(
//           child: Stack(
//             children: [
//               Container(
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   color: const Color.fromRGBO(134, 227, 220, 1)),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.of(context).size.width * 0.05,
//                     vertical: MediaQuery.of(context).size.height * 0.02),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: Container(
//                           child: Image.asset(
//                             "assets/images/menu.png",
//                             color: Color.fromRGBO(255, 255, 255, 1),
//                             height: 25,
//                             width: 25,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Image.asset("assets/images/Group1881.png"),
//                       ),
//                     ]),
//               ),
//               Positioned(
//                 left: MediaQuery.of(context).size.width * 0.15,
//                 top: MediaQuery.of(context).size.height * 0.1,
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(),
//                     Row(children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.3,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Image.asset(
//                           'assets/images/w-logo.png',
//                           width: 29,
//                           height: 29,
//                         ),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: const Color.fromRGBO(134, 227, 220, 1),
//                             border: Border.all(width: 2, color: Colors.white)),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Text("                 ")
//                     ]),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.01,
//                     ),
//                     Row(children: [
//                       InkWell(
//                         onTap: () =>
//                             _navigationService.navigateTo(SwitcherRoute),
//                         child: Container(
//                           child: Image.asset("assets/images/guard.png"),
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           width: MediaQuery.of(context).size.width * 0.15,
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(134, 227, 220, 1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10.0),
//                                 topRight: Radius.circular(10.0),
//                                 bottomLeft: Radius.circular(10.0),
//                                 bottomRight: Radius.circular(10.0),
//                               ),
//                               border: Border.all(color: Colors.white)),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       InkWell(
//                         onTap: () => LoginViewModel().navigation(),
//                         child: Text(
//                           "Dashboard",
//                           style: TextStyle(
//                               fontFamily: 'Open Sans',
//                               fontSize: 13,
//                               color: const Color.fromRGBO(107, 126, 129, 1)),
//                         ),
//                       )
//                     ]),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.02,
//                     ),
//                     Row(children: [
//                       InkWell(
//                         onTap: () {
//                           print("Login Status: " + ConstantsMessages.loginStatus.toString());
//                           SettingsViewModel().navigation();},
//                         child: Container(
//                           child: Image.asset("assets/images/settings.png"),
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           width: MediaQuery.of(context).size.width * 0.15,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(134, 227, 220, 1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10.0),
//                                 topRight: Radius.circular(10.0),
//                                 bottomLeft: Radius.circular(10.0),
//                                 bottomRight: Radius.circular(10.0),
//                               ),
//                               border: Border.all(color: Colors.white)),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       InkWell(
//                         onTap: () => SettingsViewModel().navigation(),
//                         child: Text(
//                           "Settings     ",
//                           style: TextStyle(
//                               fontFamily: 'Open Sans',
//                               fontSize: 13,
//                               color: const Color.fromRGBO(107, 126, 129, 1)),
//                         ),
//                       )
//                     ])
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: MediaQuery.of(context).size.width * 0.07,
//                     bottom: MediaQuery.of(context).size.width * 0.07),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1)),
//                         ],
//                         border: Border.all(
//                             width: 0.3,
//                             color: Color.fromRGBO(107, 126, 129, 1)),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(8.0),
//                           topRight: Radius.circular(8.0),
//                           bottomLeft: Radius.circular(8.0),
//                           bottomRight: Radius.circular(8.0),
//                         )),
//                     height: MediaQuery.of(context).size.height * 0.06,
//                     width: MediaQuery.of(context).size.height * 0.06,
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: InkWell(
//                         onTap: () => {
//                           loader = true,
//                           _localStorage.clearSharedPrefrences(),
//                           _navigationService
//                               .pushNamedAndRemoveUntil(LoginRoute),
//                           loader=false,
//                           Fluttertoast.showToast(msg: "Log Out")
//                         },
//                         child: Image.asset(
//                           "assets/images/log-out.png",
//                           color: Colors.grey,
//                           height: MediaQuery.of(context).size.height * 0.03,
//                           width: MediaQuery.of(context).size.width * 0.04,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//             clipBehavior: Clip.none,
//             // overflow: Overflow.visible,
//           ),
//         ),
//       ),
//     );
//   }
// }
