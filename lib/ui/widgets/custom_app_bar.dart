import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  double height;
  final String sName, vScreen;
  final bool fCall;
  final Function topNavigationCallBack;

  CustomAppBar(
      {@required this.height,
      @required this.sName,
      this.fCall = false,
      this.topNavigationCallBack,
      this.vScreen});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.width * 0.02, //10
                right: MediaQuery.of(context).size.width * 0.02,
                bottom: MediaQuery.of(context).size.width * 0.02, //10
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'assets/images/menu.png',
                              height: MediaQuery.of(context).size.height *
                                  0.03, //23
                              width:
                                  MediaQuery.of(context).size.width * 0.05, //23
                            )),
                      )),
                  Expanded(
                    flex: 5,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/Login2.png',
                          // width: MediaQuery.of(context).size.width *0.2, //100
                          height:
                              MediaQuery.of(context).size.height * 0.07, //60
                        ),
                        Image.asset(
                          'assets/images/Samed_up.png',
                          // width: MediaQuery.of(context).size.width *0.15, //50
                          height:
                              MediaQuery.of(context).size.height * 0.05, //35
                        ),
                        Expanded(
                          child: Image.asset('assets/images/CRICE.png',
                              // width: MediaQuery.of(context).size.width *0.1, //70
                              height: MediaQuery.of(context).size.height * 0.08),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Column(children: [
              Container(
                height: 1,
                color: const Color.fromRGBO(146, 204, 181, 1),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05, //45
                child: Center(
                    child: Text(
                  sName,
                  style: TextStyle(
                    fontSize: 19,
                    color: const Color.fromRGBO(107, 126, 130, 1),
                  ),
                )),
              ),
              Container(
                height: 1,
                color: const Color.fromRGBO(146, 204, 181, 1),
              ),
            ]),
            fCall
                ? Padding(
                    padding: EdgeInsets.only(
                      // horizontal:MediaQuery.of(context).size.width * 0.01,
                      // vertical: MediaQuery.of(context).size.height * 0.07,
                      top: MediaQuery.of(context).size.height * 0.04,
                      left: MediaQuery.of(context).size.width * 0.017,
                      right: MediaQuery.of(context).size.width * 0.015,
                    ),
                    child: CustomButtonBar(
                        callback: topNavigationCallBack, vScreen: vScreen))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
