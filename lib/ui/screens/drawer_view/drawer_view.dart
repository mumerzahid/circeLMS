import 'dart:async';

import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/constants/route_path.dart';
import 'package:crice_hospital_app/ui/screens/login_screen/login_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'drawer_viewmodel.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GlobalKey _scaffoldKey = new GlobalKey();
    return ViewModelBuilder<DrawerViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: Drawer(
                  child: Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.27,
                          color: const Color.fromRGBO(134, 227, 220, 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06,
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Image.asset(
                                    "assets/images/menu.png",
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                  "assets/images/CRICE.png",
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ),
                            ]),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.185,
                        top: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(),
                            Row(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.17,
                                height:
                                    MediaQuery.of(context).size.width * 0.17,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03),
                                  child: Image.asset(
                                    'assets/images/w-logo.png',
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromRGBO(134, 227, 220, 1),
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("                 ")
                            ]),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(children: [
                              InkWell(
                                onTap: () => model.navigationService
                                    .navigateTo(SwitcherRoute),
                                child: Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.01),
                                      child: Image.asset(
                                          "assets/images/guard.png")),
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(134, 227, 220, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () => LoginViewModel().navigation(),
                                child: Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: ConstantsMessages.fontModerate,
                                      color: const Color.fromRGBO(
                                          107, 126, 129, 1)),
                                ),
                              )
                            ]),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(children: [
                              InkWell(
                                onTap: () {
                                  print("Login Status: " +
                                      ConstantsMessages.loginStatus.toString());
                                  SettingsViewModel().navigation();
                                },
                                child: Container(
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.01),
                                      child: Image.asset(
                                          "assets/images/settings.png")),
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          134, 227, 220, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () => SettingsViewModel().navigation(),
                                child: Text(
                                  "Settings     ",
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: ConstantsMessages.fontModerate,
                                      color: const Color.fromRGBO(
                                          107, 126, 129, 1)),
                                ),
                              )
                            ])
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            bottom: MediaQuery.of(context).size.width * 0.07),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1)),
                                ],
                                border: Border.all(
                                    width: 0.3,
                                    color: Color.fromRGBO(107, 126, 129, 1)),
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                )
                            ),
                            height: MediaQuery.of(context).size.width * 0.095,
                            width: MediaQuery.of(context).size.width * 0.095,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () => {
                                  model.setIsLoading(true),
                                  Timer(Duration(milliseconds: 500), () {
                                    model.snackBar("LogOut");
                                    model.localStorage.clearSharedPrefrences();
                                    model.navigationService
                                        .pushNamedAndRemoveUntil(LoginRoute);
                                    model.setIsLoading(false);
                                  }),

                                  // model.setIsLoading(false),
                                },
                                child: Image.asset(
                                  "assets/images/log-out.png",
                                  color: Colors.grey,
                                  // height:MediaQuery.of(context).size.height * 0.03,
                                  // width:MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    clipBehavior: Clip.none,
                    // overflow: Overflow.visible,
                  ),
                ),
              ),
      ),
      // => Scaffold(
//         // key: _scaffoldKey,
//           // Container(s
//             // width: MediaQuery.of(context).size.width,
//             body: SafeArea(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(
//                   children:[
//                     Container(
//                         width: MediaQuery.of(context).size.width * 0.3,
//                         color: const Color.fromRGBO(134, 227, 220, 1)
//                     ),
//
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: MediaQuery.of(context).size.width * 0.05,
//                           vertical: MediaQuery.of(context).size.height * 0.02
//                       ),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children:[
//                             InkWell(
//                               onTap: ()=> Navigator.pop(context),
//                               child: Container(
//                                 child: Image.asset("assets/images/menu.png",
//                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                   height:25,
//                                   width: 25,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               child: Text("Testing Screen"),
//                             ),
//                             Container(
//                               child: Image.asset("assets/images/Group1881.png"),
//                             ),
//                           ]
//                       ),
//                     ),
//                     Positioned(
//                       left:MediaQuery.of(context).size.width * 0.15 ,
//                       top: MediaQuery.of(context).size.height * 0.1,
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(),
//                           Row(
//                               children:[
//                                 InkWell(
//                                   onTap: ()=> model.selectImage(fromGallery: true),
//                                   child: model.hasSelectedImage? Container(
//                                     width: MediaQuery.of(context).size.width * 0.3,
//                                     height:  MediaQuery.of(context).size.height * 0.2,
//                                     child: model.isBusy
//                                         ? CircularProgressIndicator()
//                                         : Image.file(model.selectedImage,
//                                       width: 10,
//                                       height: 10,
//                                     ),
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color:  const Color.fromRGBO(134, 227, 220, 1),
//                                         border: Border.all(
//                                             width: 2,
//                                             color: Colors.white
//                                         )
//                                     ),
//                                   ):Container(
//                                     width: MediaQuery.of(context).size.width * 0.3,
//                                     height:  MediaQuery.of(context).size.height * 0.2,
//                                     child: Image.asset('assets/images/w-logo.png',
//                                       width: 29,
//                                       height: 29,
//                                     ),
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color:  const Color.fromRGBO(134, 227, 220, 1),
//                                         border: Border.all(
//                                             width: 2,
//                                             color: Colors.white
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15,),
//
//                                 Text("                 " )
//                               ]
//
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           Row(
//                               children: [
//                                 InkWell(
//                                   onTap: ()=> LoginViewModel().navigation(),
//                                   child: Container(
//                                     child: Image.asset("assets/images/guard.png"),
//                                     height: MediaQuery.of(context).size.height * 0.08,
//                                     width:  MediaQuery.of(context).size.width * 0.15,
//                                     decoration:  BoxDecoration(
//                                         color: Color.fromRGBO(134, 227, 220, 1),
//                                         borderRadius: BorderRadius.only(
//                                           topLeft:  Radius.circular(10.0),
//                                           topRight: Radius.circular(10.0),
//                                           bottomLeft: Radius.circular(10.0),
//                                           bottomRight: Radius.circular(10.0),
//                                         ),
//                                         border: Border.all(
//                                             color: Colors.white
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15,),
//
//                                 InkWell(
//                                   onTap: ()=>LoginViewModel().navigation(),
//                                   child: Text("Dashboard",
//                                     style: TextStyle(
//                                         fontFamily: 'Open Sans',
//                                         fontSize: 13,
//                                         color: const Color.fromRGBO(107, 126, 129, 1)
//                                     ),
//                                   ),
//                                 )
//                               ]
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.02,
//                           ),
//                           Row(
//                               children: [
//                                 InkWell(
//                                   onTap: ()=> SettingsViewModel().navigation(),
//                                   child: Container(
//                                     child: Image.asset("assets/images/settings.png"),
//                                     height: MediaQuery.of(context).size.height * 0.08,
//                                     width:  MediaQuery.of(context).size.width * 0.15,
//                                     decoration:  BoxDecoration(
//                                         color:  const Color.fromRGBO(134, 227, 220, 1),
//                                         borderRadius: BorderRadius.only(
//                                           topLeft:  Radius.circular(10.0),
//                                           topRight: Radius.circular(10.0),
//                                           bottomLeft: Radius.circular(10.0),
//                                           bottomRight: Radius.circular(10.0),
//                                         ),
//                                         border: Border.all(
//                                             color: Colors.white
//                                         )
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15,),
//
//                                 InkWell(
//                                   onTap: () => SettingsViewModel().navigation(),
//                                   child: Text("Settings     ",
//                                     style: TextStyle(
//                                         fontFamily: 'Open Sans',
//                                         fontSize: 13,
//                                         color: const Color.fromRGBO(107, 126, 129, 1)
//                                     ),),
//                                 )
//
//                               ]
//                           )
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left:  MediaQuery.of(context).size.width * 0.07,
//                           bottom: MediaQuery.of(context).size.width * 0.07
//                       ),
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromRGBO(0, 0, 0, 0.1)
//                                 ),
//                               ],
//                               border: Border.all(
//                                   width: 0.3,
//                                   color: Color.fromRGBO(107, 126, 129, 1)
//                               ),
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft:  Radius.circular(8.0),
//                                 topRight: Radius.circular(8.0),
//                                 bottomLeft: Radius.circular(8.0),
//                                 bottomRight: Radius.circular(8.0),
//                               )
//                           ),
//                           height: MediaQuery.of(context).size.height * 0.06,
//                           width: MediaQuery.of(context).size.height * 0.06,
//                           child: Image.asset("assets/images/log-out.png",
//                             color: Colors.grey,
//                             height: MediaQuery.of(context).size.height * 0.03,
//                             width: MediaQuery.of(context).size.width * 0.04,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                   overflow: Overflow.visible,
//                 ),
//               ),
//             ),
//           // );
//       ),
      viewModelBuilder: () => DrawerViewModel(),
    );
  }
}
