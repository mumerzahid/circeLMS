import 'package:crice_hospital_app/ui/screens/report/report_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ReportView extends StatelessWidget {
  ReportView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportViewModel>.reactive(
      builder: (context, model, value) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          top: true,
          child: model.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Start Date",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              107, 126, 130, 1),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => model.selectStartDate(
                                            context, true),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3.0),
                                                topRight: Radius.circular(3.0),
                                                bottomLeft:
                                                    Radius.circular(3.0),
                                                bottomRight:
                                                    Radius.circular(3.0),
                                              ),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    107, 126, 130, 1),
                                              )),
                                          height: 32,
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: model.startDateBoolean
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 5,
                                                        ),
                                                        child: Text(
                                                          DateFormat.yMd()
                                                              .format(model
                                                                  .startDate),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                107,
                                                                126,
                                                                130,
                                                                1),
                                                          ),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 5,
                                                        ),
                                                        child: Text(
                                                          DateFormat.yMd()
                                                              .format(model
                                                                  .yesterday),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                107,
                                                                126,
                                                                130,
                                                                1),
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child: InkWell(
                                                      onTap: () =>
                                                          model.selectStartDate(
                                                              context, true),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.green,
                                                          size: 18,
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                    height: 35,
                                    width: 150,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(
                                            134, 227, 220, 1), // background
                                      ),
                                      onPressed: () {
                                        model.filterClick();
                                        print(model.startDate);
                                        print(model.endDate);

                                        if (model.startDate == null &&
                                                model.endDate == null ||
                                            model.startDate.isAtSameMomentAs(
                                                model.endDate) ||
                                            (model.startDate
                                                .isAfter(model.endDate))) {
                                          model.snackBar(
                                              "StartDate should be smaller than EndDate");
                                        } else if (model.startDate
                                                .isBefore(model.endDate) ||
                                            model.startDate != model.endDate) {
                                          model.setIsLoading(true);
                                          model.HtmlView(
                                              model.startDate.toString(),
                                              model.endDate.toString());
                                        }
                                      },
                                      // model.filterClick(),
                                      child: Text(
                                        "Filter",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "End Date",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              107, 126, 130, 1),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => model.selectStartDate(
                                            context, false),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3.0),
                                                topRight: Radius.circular(3.0),
                                                bottomLeft:
                                                    Radius.circular(3.0),
                                                bottomRight:
                                                    Radius.circular(3.0),
                                              ),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    107, 126, 130, 1),
                                              )),
                                          height: 32,
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: model.endDateBoolean
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Text(
                                                          DateFormat.yMd()
                                                              .format(model
                                                                  .endDate),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            // fontWeight: FontWeight.w700,
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                107,
                                                                126,
                                                                130,
                                                                1),
                                                          ),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Text(
                                                          DateFormat.yMd()
                                                              .format(model
                                                                  .currentDate),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            // fontWeight: FontWeight.w700,
                                                            fontSize: 12,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                107,
                                                                126,
                                                                130,
                                                                1),
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child: InkWell(
                                                      onTap: () =>
                                                          model.selectStartDate(
                                                              context, false),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color: Colors.green,
                                                          size: 18,
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                // model.isEnabled?Container(
                                //     // color: const Color.fromRGBO(134, 227, 220, 1),
                                //     height: 35,
                                //     width: 150,
                                //     child: ElevatedButton(
                                //       style: ElevatedButton.styleFrom(
                                //         primary: const Color.fromRGBO(
                                //             134, 227, 220, 1), // background
                                //       ),
                                //       onPressed: () => showDialog(
                                //           context: context,
                                //           builder: (BuildContext context) {
                                //             return Dialog(
                                //               shape: RoundedRectangleBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           10.0)), //this right here
                                //               child: DownloadPopupView(),
                                //             );
                                //           }),
                                //       child: Text(
                                //         "Download",
                                //         style: TextStyle(
                                //           fontFamily: 'Open Sans',
                                //           // fontWeight: FontWeight.w700,
                                //           fontSize: 16,
                                //           color: const Color.fromRGBO(
                                //               255, 255, 255, 1),
                                //         ),
                                //       ),
                                //     )
                                // ):
                                Container(
                                  // color: const Color.fromRGBO(134, 227, 220, 1),
                                  height: 35,
                                  width: 150,
                                  color: Colors.transparent,
                                  // child: ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //     primary: Colors.grey // background
                                  //   ),
                                  //   onPressed: null,
                                  //   child: Text(
                                  //     "Download",
                                  //     style: TextStyle(
                                  //       fontFamily: 'Open Sans',
                                  //       // fontWeight: FontWeight.w700,
                                  //       fontSize: 16,
                                  //       color: const Color.fromRGBO(
                                  //           255, 255, 255, 1),
                                  //     ),
                                  //   ),
                                  // )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      // model.html == null ? SizedBox() : Container(
                      //
                      //   // constraints: BoxConstraints.expand(
                      //   //   height: MediaQuery.of(context).size.height
                      //   // ),
                      //   height: MediaQuery.of(context).size.height ,
                      //
                      //       // * 0.65,
                      //   // width: MediaQuery.of(context).size.width,
                      //   // color: Colors.grey,
                      //   // child: WebviewScaffold(
                      //   //   // initialUrlRequest:
                      //   //   // URLRequest(url: Uri.parse("https://inappwebview.dev/")),
                      //   //   url: Uri.dataFromString(model.html, mimeType: 'text/html').toString(),
                      //   //   //
                      //   //   //   initialUrl: new Uri.dataFromString(model.html, mimeType: 'text/html').toString(),
                      //   //   // javascriptMode: JavascriptMode.unrestricted,
                      //   //
                      //   // ),
                      //    // child: Html(
                      //    //    data: model.html
                      //   //   )
                      //
                      //   // child: Center(
                      //   //   child: Text("Reports"),
                      //   // ),
                      // ),
                    ],
                  ),
                ),
        ),
      ),
      viewModelBuilder: () => ReportViewModel(),
    );
  }
}
