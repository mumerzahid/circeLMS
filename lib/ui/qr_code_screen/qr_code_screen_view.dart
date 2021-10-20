import 'dart:ui';

import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'qr_code_screen_viewmodel.dart';

class QrCodeScreenView extends StatelessWidget {
  const QrCodeScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QrCodeScreenViewModel>.reactive(
      builder: (context, model, child) => model.loadingScreen
          ? Center(
              child: Scaffold(
                  body: Center(
                      child: CircularProgressIndicator())),
            )
          : model.qrCodeList.isEmpty || model.qrCodeList.length == null
              ? RefreshIndicator(
                  onRefresh: model.futureToRun,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.5),
                          child: Center(
                            child: Text(
                              "No QR Codes now!",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromRGBO(107, 126, 130, 1),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )
              : model.loadingScreen
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SafeArea(
                      top: true,
                      child: Scaffold(
                          appBar: AppBar(
                            leading: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.keyboard_backspace_rounded,
                                  color: Colors.white,
                                )),
                            title: Text(
                              "QR CODES",
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: ConstantsMessages.fontVeryLarge,
                                  color: Colors.white),
                            ),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          body: RefreshIndicator(
                            onRefresh: model.futureToRun,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(children: [
                                ListView.builder(
                                  // reverse: true,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: model.qrCodeList.isEmpty ||
                                          model.qrCodeList.length == null
                                      ? 0
                                      : model.qrCodeList.length,
                                  itemBuilder: (context, index) {
                                    // String myString = model.notifications[index]
                                    //     .createdAt; //convert Date into Date Formate
                                    // DateTime now =DateTime.now()
                                    // DateTime dateTime = DateTime.parse(myString).toLocal();
                                    // String inHours = DateFormat.jm().format(dateTime);
                                    // String day =
                                    //     formatDate(dateTime, [yyyy, '-', mm, '-', dd]);

                                    return InkWell(
                                      onTap: () => showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                              child: Dialog(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(
                                                        10.0)), //this right here
                                                child: Image.network(ConstantsMessages.fBaseURL + model.qrCodeList[index].imageFileUrl,
                                                scale: 0.3,),
                                              ),
                                            );
                                          }),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        child: Column(
                                          children: [
                                            Text(
                                              model.qrCodeList[index].level,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                                model.qrCodeList[index]
                                                    .visitStatus,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                )),
                                            Container(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: model
                                                                    .qrCodeList[
                                                                        index]
                                                                    .visitStatus ==
                                                                "Checkout"
                                                            ? Colors.red
                                                            : Colors.white)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 5,
                                                          color: model.qrCodeList[index].visitStatus ==
                                                                          "Checkin" &&
                                                                      model.qrCodeList[index].level ==
                                                                          "Level 1" ||
                                                                  model.qrCodeList[index].visitStatus ==
                                                                          "Checkout" &&
                                                                      model.qrCodeList[index].level ==
                                                                          "Level 1"
                                                              ? Color.fromRGBO(
                                                                  255, 255, 255, 1)
                                                              : model.qrCodeList[index].visitStatus == "Checkin" && model.qrCodeList[index].level == "Level 2" ||
                                                                      model.qrCodeList[index].visitStatus == "Checkout" &&
                                                                          model.qrCodeList[index].level ==
                                                                              "Level 2"
                                                                  ? Color.fromRGBO(
                                                                      199, 233, 251, 1)
                                                                  : model.qrCodeList[index].visitStatus == "Checkin" && model.qrCodeList[index].level == "Level 3" ||
                                                                          model.qrCodeList[index].visitStatus == "Checkout" && model.qrCodeList[index].level == "Level 3"
                                                                      ? Color.fromRGBO(145, 204, 181, 1)
                                                                      : Color.fromRGBO(255, 255, 255, 1))),
                                                  child: Image.network(
                                                    ConstantsMessages.fBaseURL +
                                                        model.qrCodeList[index]
                                                            .imageFileUrl,
                                                    scale: 0.8,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            model.qrCodeList[index].visitStatus == "Checkout"?Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context).size.width * 0.05,
                                              horizontal: MediaQuery.of(context).size.width * 0.25,
                                            ),
                                              child: Divider(
                                                color: Colors.grey,
                                                thickness: 2,
                                              ),
                                            ):SizedBox(height: 0,)
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ]),
                            ),
                          )),
                    ),
      viewModelBuilder: () => QrCodeScreenViewModel(),
    );
  }
}
