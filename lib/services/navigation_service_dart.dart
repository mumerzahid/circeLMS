// import 'package:crice_hospital_app/app/locator.dart';
// import 'package:flutter/widgets.dart';
// import 'package:injectable/injectable.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// @lazySingleton
// class MyNavigationService{
//
//   // final GlobalKey <NavigatorState>  navigatorKey = GlobalKey<NavigatorState>();
//   final NavigationService navigationService=locator<NavigationService>();
//
//
//   Future<dynamic> navigateTo(String routeName)
//   {
//     // return navigatorKey.currentState.pushNamed(routeName);
//     return navigationService.navigateTo(routeName);
//   }
//
//   // bool goBack(){
//   //   return navigatorKey.currentState.canPop();
//   // }
// }