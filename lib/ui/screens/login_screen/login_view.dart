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
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar:
              LoginAppBar(height: MediaQuery.of(context).size.height * 0.33),
          body: model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                      children: [
                    Container(
                      padding: EdgeInsets.only(
                        // top: MediaQuery.of(context).size.height * 0.01,
                        // bottom: MediaQuery.of(context).size.height * 0.
                        // 07,
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // was c h 0.04
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/x-logo.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  // height: MediaQuery.of(context).size.height * 0.05,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: TextField(
                                    keyboardType:
                                        TextInputType.emailAddress,
                                    controller: model.emailController,
                                    onChanged: (string) {
                                      model.isEmail(string);
                                    },
                                    decoration: InputDecoration(
                                        helperText: '',
                                        contentPadding: EdgeInsets.zero,
                                        errorText: model.getVerifiedemail
                                            ? null
                                            : "Please enter the right email",
                                        // labelText: "EMAIL",
                                        //hintText: "Enter Email",
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: const Color.fromRGBO(
                                              149, 149, 149, 1),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: model.getVerifiedemail
                                              ? BorderSide(
                                                  color:
                                                      const Color.fromRGBO(
                                                          196, 196, 196, 1))
                                              : BorderSide(
                                                  color: Colors.red),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.02,
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/images/key-1.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  // height: MediaQuery.of(context).size.height * 0.05,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  child: Stack(
                                    children:[
                                      TextField(
                                        enabled: true,
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          model.verifyUsername(value);
                                        },
                                        controller: model.passwordController,
                                        obscureText: model.obsecureText,
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              149, 149, 149, 1),
                                        ),
                                        decoration: InputDecoration(
                                          helperText: '',
                                          contentPadding: EdgeInsets.zero,
                                          // helperText: '',
                                          errorText: model.getVerifiedPassword
                                              ? null
                                              : "Password must contain at least 6 characters",
                                          errorStyle: TextStyle(
                                          ),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: const Color.fromRGBO(
                                                149, 149, 149, 1),
                                          ),
                                          labelStyle: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontSize: 14,
                                              color: const Color.fromRGBO(
                                                  149, 149, 149, 1)),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: model
                                                .getVerifiedPassword
                                                ? BorderSide(
                                                color: const Color.fromRGBO(
                                                    196, 196, 196, 1))
                                                : BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: model.obsecureText?IconButton(
                                          color: Colors.grey,
                                          icon: Icon(
                                               Icons.visibility_off
                                          ), onPressed:()=>{
                                          model.obsecureValue()
                                        },
                                        ):IconButton(
                                          color: Color.fromRGBO(146, 204, 180, 1),
                                          icon: Icon(
                                              Icons.visibility
                                          ), onPressed:()=>{
                                          model.obsecureValue()
                                        },
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            InkWell(
                              onTap: () => model.logIn(
                                  model.emailController.text,
                                  model.passwordController.text),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    SizedBox(width: 25,),
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
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0)), //this right here
                                      child: DialogView(),
                                    );
                                  }),
                              child: Row(
                                children: [
                                  Container(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                ),
                                  SizedBox(width: 25,),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 6,
                                        bottom: 6,
                                        // left: MediaQuery.of(context).size.width *
                                        //     0.1
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "FORGOT PASSWORD?",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
                                        color:
                                        const Color.fromRGBO(149, 149, 149, 1),
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
          bottomNavigationBar: Container(
            child: Image.asset("assets/images/login-bottom.png",fit:BoxFit.fitWidth,),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

// Padding(
//   padding: EdgeInsets.only(
//     left: MediaQuery.of(context).size.width * 0.01,
//     right: MediaQuery.of(context).size.width * 0.01,
//   ),
//   child: TextField(
//     decoration: InputDecoration(
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: Color.fromRGBO(112, 112, 112, 1)
//           )
//       ),
//       border: OutlineInputBorder(
//         borderSide:
//         BorderSide(color: Color.fromRGBO(177, 177, 177, 1), width: 0.5),
//       ),
//       hintText: 'Minimum 6 characters',
//       hintStyle: Theme.of(context)
//           .textTheme
//           .bodyText1
//           .merge(TextStyle(color: Color.fromRGBO(177, 177, 177, 1))),
//     ),
//     keyboardType:TextInputType.text,
//     onChanged: (text) {},
//   ),
// ),

// IconButton(
// color: Colors.grey,
// icon: Icon(
// model.obsecureText
// ? Icons.visibility_off
//     : Icons.visibility
// ), onPressed:()=>model.obsecureValue(),
// )
