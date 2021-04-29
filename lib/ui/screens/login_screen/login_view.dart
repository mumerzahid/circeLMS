import 'package:crice_hospital_app/ui/widgets/login_app_view.dart';
import 'package:crice_hospital_app/ui/widgets/login_text_field.dart';
import 'package:crice_hospital_app/ui/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        top: true,
        child: Scaffold(
          appBar: LoginAppBar(height: MediaQuery.of(context).size.height * 0.3),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                  bottom: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.18,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/images/B-logo.png",
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "EMAIL",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        color: const Color.fromRGBO(
                                            149, 149, 149, 1)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color.fromRGBO(
                                              196, 196, 196, 1)),
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/images/key.png",
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  obscureText: true,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(149, 149, 149, 1),
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "PASSWORD",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        color: const Color.fromRGBO(
                                            149, 149, 149, 1)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color.fromRGBO(
                                              196, 196, 196, 1)),
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1),
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/Group 1799.png",
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18,
                                  color: const Color.fromRGBO(107, 126, 129, 1),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "FORGOT PASSWORD ?",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 16,
                              color: const Color.fromRGBO(149, 149, 149, 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          bottomNavigationBar: Container(
            child: Image.asset("assets/images/login-bottom.png"),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
