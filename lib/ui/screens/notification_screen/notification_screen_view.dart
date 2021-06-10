import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:stacked/stacked.dart';
import 'notification_screen_viewmodel.dart';

class NotificationScreenView extends StatelessWidget {
  const NotificationScreenView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationScreenViewModel>.reactive(
      builder: (context, model, child) => model.loadingScreen?Center(
        child: CircularProgressIndicator(),
      ):model.notifications.isEmpty ||
              model.notifications.length == null
          ? RefreshIndicator(
              onRefresh: model.futureToRun,
              child:
                  ListView(scrollDirection: Axis.vertical, children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.5),
                  child: Center(
                    child: Text(
                      "No notifications now!",
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
          : model.loadingScreen? Center(
        child: CircularProgressIndicator(),
      ):Scaffold(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              body: RefreshIndicator(
                onRefresh: model.futureToRun,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: LazyLoadScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Column(children: [
                        ListView.builder(
                          // reverse: true,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: model.notifications.isEmpty ||
                                  model.notifications.length == null
                              ? 0
                              : model.notifications.length,
                          itemBuilder: (context, index) {
                            String myString = model.notifications[index]
                                .createdAt; //convert Date into Date Formate
                            // DateTime now =DateTime.now()
                            DateTime dateTime = DateTime.parse(myString).toLocal();
                            String inHours = DateFormat.jm().format(dateTime);
                            String day =
                                formatDate(dateTime, [yyyy, '-', mm, '-', dd]);

                            return Column(
                              children: [
                                model.headerStatus(index)
                                    ? SizedBox()
                                    : Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.95,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        color: model.headerColor(day) == null
                                            ? Color.fromRGBO(134, 227, 220, 1)
                                            : model.headerColor(day),
                                        child: Center(
                                          child: Text(
                                            model.checkDate(day) == null
                                                ? DateFormat('dd MMM yyyy', null)
                                                    .format(dateTime)
                                                : model.checkDate(day),
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: const Color.fromRGBO(
                                                  254, 254, 254, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.02,
                                      bottom: MediaQuery.of(context).size.width *
                                          0.02,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            model.notifications[index].title,
                                            style: TextStyle(
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: const Color.fromRGBO(
                                                  25, 87, 94, 1),
                                            ),
                                          ),
                                          trailing: Text(
                                            inHours,
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
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.10,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                            child: Text(
                                              model.notifications[index]
                                                  .description,
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
                              ],
                            );
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              )),
      viewModelBuilder: () => NotificationScreenViewModel(),
    );
  }
}
