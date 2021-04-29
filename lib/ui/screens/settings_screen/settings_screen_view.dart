import 'package:crice_hospital_app/ui/screens/settings_screen/settings_screen_viewmodel.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:crice_hospital_app/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.32,
          sName: 'SETTINGS',
          fCall: false,
        ),
        drawer: MyCustomDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                // top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Mobile Number",
                          style:
                          TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: const Color.fromRGBO(107, 126, 130, 1),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003,
                  ),
                  TextFieldWidget(
                    null,
                    "+00 000 00000",
                    TextInputType.visiblePassword,
                    true,
                    null,
                    null,
                      callFunction: (value) {
                        model.setIsObscureText(value);
                      }
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: const Color.fromRGBO(107, 126, 130, 1),
                            ),
                          ))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003,
                  ),
                  TextFieldWidget(
                    null,
                    "********",
                    TextInputType.visiblePassword,
                    false,
                    null,
                    Icons.visibility_off,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        "UPDATE",
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
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
