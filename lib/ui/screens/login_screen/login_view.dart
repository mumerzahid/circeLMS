import 'package:crice_hospital_app/ui/screens/Dialog/dialog_view.dart';
import 'package:crice_hospital_app/ui/widgets/login_app_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loader = false;
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        top: true,
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:
              LoginAppBar(height: MediaQuery.of(context).size.height * 0.33),
          body: model.isLoading?Center(
            child: CircularProgressIndicator(),
          ):SingleChildScrollView(
            child: Column(
                children: [
              Container(
                padding: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height * 0.01,
                  // bottom: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // was c h 0.04
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/B-logo.png",
                            width: MediaQuery.of(context).size.width * 0.05,
                            // height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              //   width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: model.emailController,
                                  decoration: InputDecoration(
                                    labelText: "EMAIL",
                                    //hintText: "Enter Email",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            149, 149, 149, 1)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: const Color.fromRGBO(
                                              196, 196, 196, 1)),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/key.png",
                            width: MediaQuery.of(context).size.width * 0.05,
                            // height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: TextField(
                                  controller: model.passwordController,
                                  obscureText: model.obsecureText,
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(149, 149, 149, 1),
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "PASSWORD",
                                    suffixIcon: InkWell(
                                      onTap: ()=> model.obsecureValue(),
                                        child: Icon(model.obsecureText?Icons.visibility_off:Icons.visibility)
                                    ),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
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
                      InkWell(
                        onTap: () => model.logIn(
                            model.emailController.text,
                            model.passwordController.text),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.15),
                          child:
                          // model.isLoading
                          //     ? Center(child: CircularProgressIndicator())
                          //     :
                          Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/Group 1799.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.09,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Container(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 16,
                                          color: const Color.fromRGBO(
                                              107, 126, 129, 1),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () =>
                            showDialog(context: context,
                            builder: (BuildContext context) {
                              return  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0)), //this right here
                                child: DialogView(),
                              );
                            }
                            ),
                            // model.toResetNav(),
                            // model.toResetNav(),
                            // model.snackBar("Link has been sent your registered email!"),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                              left: MediaQuery.of(context).size.width * 0.15),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "FORGOT PASSWORD ?",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              color: const Color.fromRGBO(149, 149, 149, 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
            ),
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
