import 'package:crice_hospital_app/ui/screens/report/report_viewmodel.dart';
import 'package:crice_hospital_app/ui/widgets/custom_app_bar.dart';
import 'package:crice_hospital_app/ui/widgets/custom_button_bar.dart';
import 'package:crice_hospital_app/ui/widgets/drawyer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height * 0.05
                      ),
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start Date",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(107, 126, 130, 1),
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      model.selectStartDate(context, true),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
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
                                                  padding: EdgeInsets.only(
                                                    left: 5,
                                                  ),
                                                  child: Text(
                                                    DateFormat.yMd().format(
                                                        model.startDate),
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromRGBO(
                                                              107, 126, 130, 1),
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 5,
                                                  ),
                                                  child: Text(
                                                    DateFormat.yMd().format(
                                                        model.currentDate),
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromRGBO(
                                                              107, 126, 130, 1),
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
                                                child: Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: Colors.green,
                                                  size: 18,
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
                                onPressed: () => model.filterClick(),
                                child: Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "End Date",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(107, 126, 130, 1),
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      model.selectStartDate(context, true),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.0),
                                          topRight: Radius.circular(3.0),
                                          bottomLeft: Radius.circular(3.0),
                                          bottomRight: Radius.circular(3.0),
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
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    DateFormat.yMd()
                                                        .format(model.endDate),
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromRGBO(
                                                              107, 126, 130, 1),
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    DateFormat.yMd().format(
                                                        model.currentDate),
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      // fontWeight: FontWeight.w700,
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromRGBO(
                                                              107, 126, 130, 1),
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
                                                child: Icon(
                                                  Icons.calendar_today_outlined,
                                                  color: Colors.green,
                                                  size: 18,
                                                )))
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                          Container(
                              // color: const Color.fromRGBO(134, 227, 220, 1),
                              height: 35,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(
                                      134, 227, 220, 1), // background
                                ),
                                onPressed: model.isEnabled ? () {} : null,
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Center(
                      child: Text(
                    "Reports",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: const Color.fromRGBO(107, 126, 130, 1),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ReportViewModel(),
    );
  }
}
