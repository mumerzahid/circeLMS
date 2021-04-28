import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize{
  // final Widget child;
  final double height;
  final String sName , vScreen;
  final bool fCall;
  final Function topNavigationCallBack;


  CustomAppBar({@required this.height, @required this.sName,this.fCall=false,this.topNavigationCallBack, this.vScreen});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width *0.04,
                right: MediaQuery.of(context).size.width *0.02,
                top: 10,
                bottom: 15,
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
                          alignment : Alignment.centerLeft,
                            child: Image.asset('assets/images/menu.png',
                            height: 23,
                            width: 23,)),
                      )
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/Group1883.png' ,
                            width: 100,
                            height: 60,
                        ),
                        Image.asset('assets/images/Group1882.png',
                        width: 50,
                        height: 35,),
                        Image.asset('assets/images/Group1881.png',
                        width: 70,
                        height: 70,),
                      ],
                    ),
                  )

                ],
              ),
            ),
            Center(
              child: Column(
                  children: [
                Container(
                  height: 1,
                  color: const Color.fromRGBO(146, 204, 181, 1),
                ),
                Container(
                  height: 44,
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
            ),
            fCall ? Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06
              ),
                child: CustomButtonBar(callback: topNavigationCallBack , vScreen: vScreen )
            ) : Container()
          ],
          // height: preferredSize.height,
          // color: Colors.orange,
          // alignment: Alignment.center,
          // child: child,

        ),
      ),
    );
  }

}