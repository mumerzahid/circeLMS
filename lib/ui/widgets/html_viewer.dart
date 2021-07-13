import 'dart:async';

import 'package:crice_hospital_app/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.keyboard_backspace_rounded,
                color: Colors.white,
              )),
          title: Text(
            "HOSPITAL REPORT",
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: position,
          children: <Widget>[
            widget.data == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : WebView(
                    allowsInlineMediaPlayback: true,
                    initialUrl: widget.data,
                    onPageStarted: (value) {
                      setState(() {
                        position = 1;
                      });
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onPageFinished: (value) {
                      setState(() {
                        position = 0;
                      });
                    }),
            loader
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox()
          ],
        ));
  }
}
