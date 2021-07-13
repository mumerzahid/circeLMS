import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAppBar extends PreferredSize {
  final double height;

  LoginAppBar({
    this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/Login2.png",
                  // width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Image.asset("assets/images/Samed_up.png",
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.07),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.066,
                right: MediaQuery.of(context).size.width * 0.066,
                top: MediaQuery.of(context).size.width * 0.04,
                // vertical: MediaQuery.of(context).size.height * 0.04
            ),
            child: Image.asset("assets/images/loog.png"),
          ),
          Row(
            children:[
              Container(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
              SizedBox(width: 25,),
              Text("For use by hospital staff only",
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 16,
                  color: const Color.fromRGBO(
                      107, 126, 129, 1),
                ),),
            ]
          ),
        ],
      ),
    );
  }
}
