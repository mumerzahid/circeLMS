
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              top: MediaQuery.of(context).size.height * 0.01, //10
              right: MediaQuery.of(context).size.width * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.01, //10
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
                            height:
                                MediaQuery.of(context).size.height * 0.03, //23
                            width:
                                MediaQuery.of(context).size.width * 0.05, //23
                          )),
                    )),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/Group1883.png',
                          // width: MediaQuery.of(context).size.width *0.2, //100
                          height: MediaQuery.of(context).size.height * 0.1, //60
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/Group1882.png',
                          // width: MediaQuery.of(context).size.width *0.15, //50
                          height:
                              MediaQuery.of(context).size.height * 0.05, //35
                        ),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/Group1881.png',
                            // width: MediaQuery.of(context).size.width *0.1, //70
                            height: MediaQuery.of(context).size.height * 0.1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
                  fontSize: 22,
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
                    top: MediaQuery.of(context).size.height * 0.06,
                    left: MediaQuery.of(context).size.width * 0.017,
                    right: MediaQuery.of(context).size.width * 0.015,
                  ),
                  child: CustomButtonBar(
                      callback: topNavigationCallBack, vScreen: vScreen))
              : Container(
                  height: 0,
                )
        ],
      ),
    );
  }
}
