import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_viewmodel.dart';
import 'package:crice_hospital_app/ui/shared/style_size.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VisitScreenView extends StatelessWidget {
  const VisitScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VisitScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // verticalSpaceLarge,
              // verticalSpaceTiny,
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.width * 0.04,
                        left: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Center(
                        child: Card(
                          shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
                          elevation: 2,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "UserName:",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            107, 126, 130, 1),
                                      ),
                                    ),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                      child: Text(
                                        " Masoom",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: const Color.fromRGBO(
                                              107, 126, 130, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                color: const Color.fromRGBO(146, 204, 181, 1),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Email Address:",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                        flex: 6,
                                        child: Text(
                                          "masomtrainer@gmail.com ",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Level of Access:",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                        flex: 6,
                                        child: Text(
                                          "Lorem Ipsum ",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Company Name:",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                        flex: 6,
                                        child: Text(
                                          "Masom Trainer",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Check-in-Date Time:",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                        flex: 6,
                                        child: Text(
                                          "21 February 2020, 04:38 PM",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Check-Out Date Time:",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        )),
                                    // horizontalSpaceLarge,
                                    Expanded(
                                        flex: 6,
                                        child: Text(
                                          "21 February 2021, 06:48 PM",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      viewModelBuilder: () => VisitScreenViewModel(),
    );
  }
}
