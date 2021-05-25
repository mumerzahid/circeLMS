import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomButtonBar extends StatelessWidget {
  final Function callback;
  final String vScreen;


   CustomButtonBar({Key key, this.callback, this.vScreen})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          // padding: EdgeInsets.only(
          // bottom: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          // ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.009,
            color: Color.fromRGBO(134, 227, 220, 12),
          ),
        ),
        Padding(
          // top: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  callback(0, "DASHBOARD");
                  // DashboardViewModel().navigation();
                  // ScreenSwitcherViewModel().dashboardLoad();
                  print("Successfully");
                },
                child: CustomButton(
                  imgUrl: 'assets/images/home.png',
                  screenName: "Dashboard",
                  pressed: vScreen == "DASHBOARD" ? true : false,
                ),
              ),
              // SizedBox(width: 0.1,),

              InkWell(
                onTap: () {
                  callback(1, "REPORTS");
                  print(Text("Reports"));
                },
                child: CustomButton(
                  imgUrl: 'assets/images/list-bullet.png',
                  screenName: "Reports",
                  pressed: vScreen == "REPORTS" ? true : false,
                ),
              ),
              // SizedBox(width: 0.4,),
              InkWell(
                onTap: () {
                  callback(2, "VISITS");
                  print(Text("Visits"));
                },
                child: CustomButton(
                  imgUrl: 'assets/images/list-task.png',
                  screenName: "Visits",
                  pressed: vScreen == "VISITS" ? true : false,
                  // pressed: true,
                ),
              ),
              // SizedBox(width: 0.1,),
              InkWell(
                onTap: () {
                  callback(3, "NOTIFICATIONS");
                  print(Text("Notifications"));
                },
                child: CustomButton(
                  imgUrl: 'assets/images/bell.png',
                  screenName: "Notifications",
                  pressed: vScreen == "NOTIFICATIONS" ? true : false,
                ),
              )
            ],
          ),
        ),
      ],
      clipBehavior: Clip.none,
      // overflow: Overflow.visible,
    );
  }
}

// left: MediaQuery.of(context).size.width * 0.1, 33, 57
