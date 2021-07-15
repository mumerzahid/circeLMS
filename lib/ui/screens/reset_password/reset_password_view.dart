import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:crice_hospital_app/ui/screens/reset_password/reset_password_viewmodel.dart';

class ResetView extends StatelessWidget {
  const ResetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
              // top: true,
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "EMAIL",
                              labelStyle: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: ConstantsMessages.fontLarge,
                                  color:
                                      const Color.fromRGBO(149, 149, 149, 1)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromRGBO(196, 196, 196, 1)),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: ConstantsMessages.fontVeryLarge,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(134, 227, 220, 1),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          child: Text(
                            "Go Back",
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: ConstantsMessages.fontVeryLarge,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(134, 227, 220, 1),
                          ),
                          onPressed: () =>
                              model.navigationService.popRepeated(1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ResetViewModel());
  }
}
