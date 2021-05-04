import 'package:crice_hospital_app/ui/screens/drawer_view/drawer_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/login_screen/login_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switch_view.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switcher_viewmodel.dart';
import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          child: Stack(
            children:[
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: const Color.fromRGBO(134, 227, 220, 1)
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.02
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    InkWell(
                      onTap: ()=> Navigator.pop(context),
                      child: Container(
                        child: Image.asset("assets/images/menu.png",
                          color: Color.fromRGBO(255, 255, 255, 1),
                          height:25,
                          width: 25,
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset("assets/images/Group1881.png"),
                    ),
                  ]
                ),
              ),
              Positioned(
                left:MediaQuery.of(context).size.width * 0.15 ,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(),
                    Row(
                      children:[
                        Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height:  MediaQuery.of(context).size.height * 0.2,
                        child: Image.asset('assets/images/w-logo.png',
                          width: 29,
                          height: 29,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:  const Color.fromRGBO(134, 227, 220, 1),
                            border: Border.all(
                                width: 2,
                                color: Colors.white
                            )
                        ),
                      ),
                        SizedBox(width: 15,),

                        Text("                 " )
                      ]

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: ()=> LoginViewModel().navigation(),
                          child: Container(
                            child: Image.asset("assets/images/guard.png"),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width:  MediaQuery.of(context).size.width * 0.15,
                            decoration:  BoxDecoration(
                                color: Color.fromRGBO(134, 227, 220, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft:  Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                border: Border.all(
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),

                        InkWell(
                          onTap: ()=>LoginViewModel().navigation(),
                          child: Text("Dashboard",
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 13,
                                color: const Color.fromRGBO(107, 126, 129, 1)
                            ),
                          ),
                        )
                      ]
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: ()=> SettingsViewModel().navigation(),
                          child: Container(
                            child: Image.asset("assets/images/settings.png"),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width:  MediaQuery.of(context).size.width * 0.15,
                            decoration:  BoxDecoration(
                                color:  const Color.fromRGBO(134, 227, 220, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft:  Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                border: Border.all(
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),

                        InkWell(
                          onTap: () => SettingsViewModel().navigation(),
                          child: Text("Settings     ",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 13,
                              color: const Color.fromRGBO(107, 126, 129, 1)
                          ),),
                        )

                      ]
                    )

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left:  MediaQuery.of(context).size.width * 0.07,
                    bottom: MediaQuery.of(context).size.width * 0.07
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1)
                          ),
                        ],
                      border: Border.all(
                          width: 0.3,
                        color: Color.fromRGBO(107, 126, 129, 1)
                      ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft:  Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                        )
                    ),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.06,
                    child: Image.asset("assets/images/log-out.png",
                      color: Colors.grey,
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
            overflow: Overflow.visible,
          ),
            ),
      ),
    );
  }
}


