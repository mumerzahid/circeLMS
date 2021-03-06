import 'package:flutter/cupertino.dart';

class LoginAppBar extends PreferredSize{
final double height;

  LoginAppBar({this.height,});

@override
Size get preferredSize => Size.fromHeight(height);
Widget build(BuildContext context){
  return SafeArea(
    top: true,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding:EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/Group1883.png",
                  // width: MediaQuery.of(context).size.width * 0.23,
                  // height:MediaQuery.of(context).size.height * 0.08
                  ),
                  Image.asset("assets/images/Group1882.png",
                      // width: MediaQuery.of(context).size.width * 0.25,
                      // height:MediaQuery.of(context).size.height * 0.08
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal:MediaQuery.of(context).size.width * 0.066,
                 vertical:MediaQuery.of(context).size.height * 0.05
              ),
            child: Image.asset("assets/images/loog.png"),
                  ),
        ],
      )
  );
}
}