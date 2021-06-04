import 'dart:async';

import 'package:crice_hospital_app/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';



// String selectedUrl = 'https://flutter.io';
//
// // ignore: prefer_collection_literals
// final Set<JavascriptChannel> jsChannels = [
//   JavascriptChannel(
//       name: 'Print',
//       onMessageReceived: (JavascriptMessage message) {
//         print(message.message);
//       }),
// ].toSet();
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(HtmlViewer());
// }

class HtmlViewer extends StatefulWidget {
  final String data;
  HtmlViewer({Key key, this.data}) : super(key: key);

  @override
  _HtmlViewerState createState() => _HtmlViewerState();
}

class _HtmlViewerState extends State<HtmlViewer> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool loader = true;

  num position = 1;

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.keyboard_backspace_rounded)),
            title: Text(
              "HOSPITAL REPORT",
              style: TextStyle(
                fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black
              ),
            ),
            centerTitle: true ,
        ),
        body:
            IndexedStack(
                index: position,
              children: <Widget>[
                widget.data == null
                    ? SizedBox()
                    :
                    WebView(
                      allowsInlineMediaPlayback: true,

                      initialUrl:widget.data,
                    onPageStarted: (value){
                        setState(() {
                          position = 1;
                        });

                    },

                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                      },
                      onPageFinished: (value){
                       setState(() {
                         position = 0;
                       });
                      }
                      ),
               loader ? Center( child: CircularProgressIndicator(),)
              : SizedBox()



              ],
            )



                // WebviewScaffold(
                //   withZoom: true,
                //   withLocalStorage: true,
                //   withJavascript: true,
                //   url: "http://79.143.187.147:3000/visits/hospital_facility_report_mob?start_date=2010-05-06&end_date=2021-05-06",

                  // Uri.dataFromString(data, mimeType: 'text/html')
                  //     .toString(),
                ),
              );
      // );
    // );
  }
}
