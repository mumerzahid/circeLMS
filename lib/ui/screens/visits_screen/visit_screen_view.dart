import 'package:crice_hospital_app/ui/screens/visits_screen/visit_screen_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class VisitScreenView extends StatelessWidget {
  const VisitScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VisitScreenViewModel>.reactive(
      builder: (context, model, child) => model.screenLoading
          ? Center(child: CircularProgressIndicator())
          : model.visits.isEmpty || model.visits.length == null
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
                              "No visits today!",
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
              : model.screenLoading
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      body: model.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : RefreshIndicator(
                              onRefresh: model.futureToRun,
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    // verticalSpaceLarge,
                                    // verticalSpaceTiny,
                                    model.isLoading
                                        ? CircularProgressIndicator()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            // physics: ScrollPhysics(),
                                            itemCount:
                                                model.visits.length == 0 ||
                                                        model.visits == null
                                                    ? 0
                                                    : model.visits.length,
                                            itemBuilder: (context, index) {
                                              // model.visits.length == null || model.visits == null ? Center(
                                              //   child: Text("No visits available now"),
                                              // ):
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                ),
                                                child: Center(
                                                  child: Card(
                                                    shadowColor:
                                                        const Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                    elevation: 2,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  left: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Username :  ",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      107,
                                                                      126,
                                                                      130,
                                                                      1),
                                                                ),
                                                              ),
                                                              // horizontalSpaceLarge,
                                                              Expanded(
                                                                child: Text(
                                                                  "" +
                                                                      model
                                                                          .visits[
                                                                              index]
                                                                          .userName,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        14,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        107,
                                                                        126,
                                                                        130,
                                                                        1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 2,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              146, 204, 181, 1),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Row(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    "Email Address:",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )
                                                              ),
                                                              // horizontalSpaceLarge,
                                                              Expanded(
                                                                  flex: 6,
                                                                  child: Text(
                                                                    model
                                                                        .visits[
                                                                            index]
                                                                        .user_email,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                child: Text(
                                                                  "Level of Access:",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        12,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        107,
                                                                        126,
                                                                        130,
                                                                        1),
                                                                  ),
                                                                ),
                                                              ),
                                                              // SizedBox(width: MediaQuery.of(context).size.width * 0.13,),
                                                              // horizontalSpaceLarge,
                                                              Container(
                                                                color: model.levelColor(model.visits[index].level),
                                                                alignment: Alignment.centerLeft,
                                                                width: 40,
                                                                height: 25,
                                                                child: Text(
                                                                  model
                                                                      .visits[
                                                                          index]
                                                                      .level,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        12,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        107,
                                                                        126,
                                                                        130,
                                                                        1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    "Company Name:",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )),
                                                              // horizontalSpaceLarge,
                                                              Expanded(
                                                                  flex: 6,
                                                                  child: Text(
                                                                    model
                                                                        .visits[
                                                                            index]
                                                                        .companyName,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    "Check-in Date Time:",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )),
                                                              // horizontalSpaceLarge,
                                                              Expanded(
                                                                  flex: 6,
                                                                  child: Text(
                                                                    model
                                                                        .visits[
                                                                            index]
                                                                        .checkInTimeAndDate,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5,
                                                                  bottom: 10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    "Check-Out Date Time:",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
                                                                    ),
                                                                  )),
                                                              // horizontalSpaceLarge,
                                                              Expanded(
                                                                  flex: 6,
                                                                  child: Text(
                                                                    model
                                                                        .visits[
                                                                            index]
                                                                        .checkOutTimeAndDate,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          12,
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          107,
                                                                          126,
                                                                          130,
                                                                          1),
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
                    ),
      viewModelBuilder: () => VisitScreenViewModel(),
    );
  }
}
