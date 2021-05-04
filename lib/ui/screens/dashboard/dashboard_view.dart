import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.32,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(107, 126, 130, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      )),
                  child: Center(
                    child: Text(
                      "News Feeds",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                        bottom: MediaQuery.of(context).size.height * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.25)
                                  .withOpacity(0.4),
                            ),
                          ],
                          border: Border(
                            left: BorderSide(
                                width: 5,
                                color: const Color.fromRGBO(146, 204, 180, 1)),
                            // top: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: const Color.fromRGBO(
                                            107, 126, 130, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/download.png",
                                            width: 27,
                                            height: 27,
                                          )))
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Date: 17-01-1998",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                // child:
                ,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(107, 126, 130, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      )),
                  child: Center(
                    child: Text(
                      "Training Resources",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Container(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              child:
                                  Image.asset('assets/images/video-camera.png'),
                            ),
                            ListTile(
                              title: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing eii",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: const Color.fromRGBO(107, 126, 130, 1),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Date: 17-01-1998",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
                                    ),
                                  )),
                            )

                            // Text(""data"")
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            Container(
                              color: const Color.fromRGBO(246, 246, 246, 1),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/images/doc.png'),
                            ),
                            ListTile(
                              title: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing eii",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: const Color.fromRGBO(107, 126, 130, 1),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Date: 19-09-1998",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
                                    ),
                                  )),
                            )

                            // Text(""data"")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
