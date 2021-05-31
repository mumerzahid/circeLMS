import 'package:crice_hospital_app/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:stacked_services/stacked_services.dart';


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

class HtmlViewer extends StatelessWidget {
  final String data;
  final NavigationService _navigationService = locator<NavigationService>();

  HtmlViewer({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
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
        body: data == null
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.all(20),
                child: WebviewScaffold(
                  withZoom: true,
                  withLocalStorage: true,
                  withJavascript: true,
                  url: Uri.dataFromString(data, mimeType: 'text/html')
                      .toString(),
                ),
              ),
      ),
    );
  }
}
