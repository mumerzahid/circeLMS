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
    return SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
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
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Image.asset("assets/images/Login1.png",
                        // width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.08),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.066,
                    vertical: MediaQuery.of(context).size.height * 0.04),
                child: Image.asset("assets/images/loog.png"),
              ),
            ],
          ),
        ));
  }
}
