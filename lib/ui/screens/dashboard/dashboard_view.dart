import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/ui/screens/youtube_player/youtube_video_player_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';
import 'package:date_format/date_format.dart';
import 'package:crice_hospital_app/ui/widgets/FeedsView.dart';

class DashboardView extends StatelessWidget {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.width * 0.002;
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) {
        return
          // model.trList.isEmpty && model.feedlist.isEmpty
          //   ?
          model.isLoading
                ? Center(child: CircularProgressIndicator())
        //         : RefreshIndicator(
        //   onRefresh: model.futureToRun,
        //   child: ListView(
        //       scrollDirection: Axis.vertical,
        //       children: <Widget>[
        //         Padding(
        //           padding: EdgeInsets.only(
        //               top: MediaQuery.of(context).size.width * 0.5),
        //           child: Center(
        //             child: Text(
        //               "No dashboard data!",
        //               style: TextStyle(
        //                 fontFamily: 'Open Sans',
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 16,
        //                 color: const Color.fromRGBO(107, 126, 130, 1),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ]),
        // )
            : Scaffold(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                body: model.isLoading
                    ? CircularProgressIndicator()
                    : RefreshIndicator(
                        onRefresh: model.futureToRun,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  // color: Colors.grey,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),

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
                                        fontSize: 16 * unitHeightValue,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              model.feedStatus()
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      child: Center(
                                        child: Text(
                                          "No content found!",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14 * unitHeightValue,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        ),
                                      ),
                                    )
                                  : model.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: model.feedlist != null
                                              ? model.feedlist.length
                                              : 0,
                                          itemBuilder: (context, index) {
                                            String myString = model
                                                .feedlist[index]
                                                .updatedAt; //convert Date into Date Formate
                                            DateTime dateTime =
                                                DateTime.parse(myString);
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02),
                                              child: Card(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color
                                                                      .fromRGBO(
                                                                  0, 0, 0, 0.25)
                                                              .withOpacity(0.4),
                                                        ),
                                                      ],
                                                      border: Border(
                                                        left: BorderSide(
                                                            width: 5,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                146,
                                                                204,
                                                                180,
                                                                1)),
                                                        // top: BorderSide(color: Colors.grey)
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 7,
                                                                // child:
                                                                child: InkWell(
                                                                  onTap: () =>
                                                                      Navigator
                                                                          .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            DashboardFeeds(
                                                                              htmlView: model.feedlist[index].content,
                                                                              title: model.feedlist[index].newsFeedTitle,
                                                                            )),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(7),
                                                                    child: Text(
                                                                      model
                                                                          .feedlist[
                                                                              index]
                                                                          .newsFeedTitle,
                                                                      style:
                                                                          TextStyle(
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        fontSize:
                                                                            13 * unitHeightValue,
                                                                        color: const Color.fromRGBO(
                                                                            107,
                                                                            126,
                                                                            130,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                  flex: 2,
                                                                  child: Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          model.feedlist[index].documentDownloadUrl.isEmpty
                                                                              ? model.snackBar("No attachments")
                                                                              : model.downloadFile(
                                                                                  context,
                                                                                  ConstantsMessages.fBaseURL + model.feedlist[index].documentDownloadUrl,
                                                                                  model.feedlist[index].documentFileName == '' || model.feedlist[index].documentFileName == null ? "Report $index.pdf" : model.feedlist[index].documentFileName,
                                                                                );
                                                                          SizedBox();
                                                                        },
                                                                        child: model.feedlist[index].documentDownloadUrl.isEmpty
                                                                            ? SizedBox()
                                                                            : Padding(
                                                                                padding: EdgeInsets.all(4),
                                                                                child: Image.asset(
                                                                                  "assets/images/download.png",
                                                                                  width: 27,
                                                                                  height: 27,
                                                                                ),
                                                                              ),
                                                                      )))
                                                            ],
                                                          ),
                                                          Divider(
                                                            color: Colors.grey,
                                                          ),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child: Text(
                                                                "Date: " +
                                                                    formatDate(
                                                                        dateTime,
                                                                        [
                                                                          dd,
                                                                          '-',
                                                                          mm,
                                                                          '-',
                                                                          yyyy
                                                                        ]),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 12 * unitHeightValue,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      107,
                                                                      126,
                                                                      130,
                                                                      1),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
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
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  // color: Colors.grey,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          107, 126, 130, 1),
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
                                        fontSize: 16 * unitHeightValue,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              model.trStatus()
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      child: Center(
                                        child: Text(
                                          "No content found!",
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14 * unitHeightValue,
                                            color: const Color.fromRGBO(
                                                107, 126, 130, 1),
                                          ),
                                        ),
                                      ),
                                    )
                                  : model.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: model.trList != null
                                              ? model.trList.length
                                              : 0,
                                          itemBuilder: (context, index) {
                                            String myString = model
                                                .trList[index]
                                                .updatedAt; // convert date into Date Format
                                            DateTime dateTime =
                                                DateTime.parse(myString);
                                            model.splittingString(model
                                                .trList[index]
                                                .documentFileName);
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Container(
                                                child: InkWell(
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            color: const Color
                                                                    .fromRGBO(246,
                                                                246, 246, 1),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.2,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: model
                                                                    .trList[
                                                                        index]
                                                                    .traningVideoLink
                                                                    .isEmpty
                                                                ? InkWell(
                                                                    child: Icon(
                                                                      Icons
                                                                          .attachment_sharp,
                                                                      size: 80,
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )
                                                                : InkWell(
                                                                    onTap: () => Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => YoutubeView(
                                                                                  url: model.trList[index].traningVideoLink,
                                                                                  title: model.trList[index].traningVideoTitle.isEmpty ? "CRICE VIDEOS" : model.trList[index].traningVideoTitle,
                                                                                ))),
                                                                    child: Icon(
                                                                      Icons
                                                                          .video_library,
                                                                      size: 80,
                                                                      color: Color.fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )),
                                                        // Image.asset(
                                                        // "assets/images/download.png")
                                                        ListTile(
                                                          title: Text(
                                                            model.trList[index]
                                                                .traningVideoTitle,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 13 * unitHeightValue,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  107,
                                                                  126,
                                                                  130,
                                                                  1),
                                                            ),
                                                          ),
                                                          trailing: model
                                                                  .trList[index]
                                                                  .documentDownloadUrl
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap: () => model
                                                                          .trList[
                                                                              index]
                                                                          .documentDownloadUrl
                                                                          .isEmpty
                                                                      ? Fluttertoast.showToast(
                                                                          msg:
                                                                              "Invalid Link")
                                                                      : model
                                                                          .downloadFile(
                                                                              context,
                                                                              ConstantsMessages.fBaseURL + model.trList[index].documentDownloadUrl,
                                                                              model.trList[index].documentFileName)
                                                                          .then((onValue) {}),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        "Document",
                                                                        style:
                                                                            TextStyle(
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              13 * unitHeightValue,
                                                                          color: const Color.fromRGBO(
                                                                              107,
                                                                              126,
                                                                              130,
                                                                              1),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        ":",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              13 * unitHeightValue,
                                                                          color: const Color.fromRGBO(
                                                                              107,
                                                                              126,
                                                                              130,
                                                                              1),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8),
                                                                        child: Image
                                                                            .asset(
                                                                          "assets/images/download.png",
                                                                          width:
                                                                              27,
                                                                          height:
                                                                              27,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ),
                                                        Divider(
                                                          color: Colors.grey,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                "Date: " +
                                                                    formatDate(
                                                                        dateTime,
                                                                        [
                                                                          dd,
                                                                          '-',
                                                                          mm,
                                                                          '-',
                                                                          yyyy
                                                                        ]),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 12 * unitHeightValue,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      107,
                                                                      126,
                                                                      130,
                                                                      1),
                                                                ),
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                            ],
                          ),
                        ),
                      ),
              );
      },
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
