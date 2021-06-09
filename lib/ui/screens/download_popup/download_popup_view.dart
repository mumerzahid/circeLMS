import 'package:crice_hospital_app/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';

import 'download_popup_viewmodel.dart';

class DownloadPopupView extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DownloadPopupViewModel>.reactive(
      builder: (context, model, child) => Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Are you sure you want to download ?",
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                    color: const Color.fromRGBO(149, 149, 149, 1)),
              )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(134, 227, 220, 1),
                      ),
                      onPressed: () => _navigationService.popRepeated(1),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // width: 180,

                    // height: 40,

                    child: ElevatedButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(134, 227, 220, 1),
                        ),
                        onPressed: () {}),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DownloadPopupViewModel(),
    );
  }
}
