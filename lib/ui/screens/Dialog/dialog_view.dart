import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/ui/screens/login_screen/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:crice_hospital_app/constants/route_path.dart' as routes;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dialog_viewmodel.dart';

class  DialogView extends StatelessWidget {
  var dialogeContext;

final NavigationService _navigationService = locator<NavigationService>();

@override
Widget build(BuildContext context) {
  dialogeContext= context;
  return ViewModelBuilder<DialogViewModel>.reactive(
builder: (context, model, child) => Container(
height: MediaQuery.of(context).size.height * 0.35,
  child: Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text("Forgot Password",
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14,
                  color: const Color.fromRGBO(149, 149, 149, 1)
              ),
            )
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: model.emailController,
           onChanged: (string) {
                              model.isEmail(string);},
          decoration: InputDecoration(
            errorText: model.getVerifiedemail?null:"Please enter the correct email",
            labelText: "EMAIL",
            labelStyle: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 14,
                color: const Color.fromRGBO(149, 149, 149, 1)),
            focusedBorder: UnderlineInputBorder(
              borderSide: model.getVerifiedemail?
              BorderSide(color: const Color.fromRGBO(196, 196, 196, 1)):BorderSide(color: Colors.red),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        model.isLoading?CircularProgressIndicator():Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Container(
              child: ElevatedButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(134, 227, 220, 1),
                ),
                onPressed: ()=> Navigator.of(context, rootNavigator: true).pop()
              ),
            ),
            SizedBox(width: 10,),
            Container(
              // width: 180,

              // height: 40,

              child: ElevatedButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(134, 227, 220, 1),
                ),
                onPressed: ()=>{
                  model.resetPassword(model.emailController.text,context),

                  //
                }
              ),
            ),
          ]),
        ),
      ],
    ),
  ),
),
viewModelBuilder: () => DialogViewModel(),
);
}
}
