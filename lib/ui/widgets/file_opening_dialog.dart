import 'package:crice_hospital_app/constants/route_path.dart';
import 'package:crice_hospital_app/ui/screens/screen_switcher/screen_switch_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:stacked_services/stacked_services.dart';

class FileOpeningDialog extends StatefulWidget {
 final String path;
 final NavigationService _navigationService =NavigationService();

  FileOpeningDialog({Key key, this.path}) : super(key: key);

  @override
  _FileOpeningDialogState createState() => _FileOpeningDialogState();
}

class _FileOpeningDialogState extends State<FileOpeningDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text("Are you sure you want to open this file ?",
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                    color: const Color.fromRGBO(149, 149, 149, 1)
                ),
              )
          ),
          SizedBox(height: 20,),

          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                          // Navigator.pushAndRemoveUntil(
                          // context,
                          // PageRouteBuilder(pageBuilder: (c, a1, a2) => ScreenSwitchView()),
                          //     (Route<dynamic> route) => false)
                    ),
                  ),
                  SizedBox(width: 20,),
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
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                          OpenFile.open(widget.path);}
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
