import 'package:crice_hospital_app/ui/shared/style_size.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'notification_screen_viewmodel.dart';

class NotificationScreenView extends StatelessWidget {
  const NotificationScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Column(children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              "Today",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromRGBO(254, 254, 254, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02,
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08),
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text(
                                    "Title",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color:
                                          const Color.fromRGBO(25, 87, 94, 1),
                                    ),
                                  ),
                                  trailing: Text(
                                    "Date",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            107, 126, 129, 1),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.02,
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08),
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Text(
                                    "Title",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color:
                                          const Color.fromRGBO(25, 87, 94, 1),
                                    ),
                                  ),
                                  trailing: Text(
                                    "Date",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            107, 126, 129, 1),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ]),
            ),
          )),
      viewModelBuilder: () => NotificationScreenViewModel(),
    );
  }
}
