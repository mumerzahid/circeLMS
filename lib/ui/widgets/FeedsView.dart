// This Widget is use in Dashboard FeedsPart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DashboardFeeds extends StatelessWidget {
  final String htmlView;
  final String title;

  const DashboardFeeds({Key key, this.htmlView , this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.keyboard_backspace_rounded,
                color:Colors.white,
              )
          ),
          title: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 14,
              color: Colors.white
                ) ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: htmlView == null || htmlView.isEmpty? Padding(
            padding: EdgeInsets.symmetric(
              vertical:MediaQuery.of(context).size.width * 0.9
            ),
            child: Center(
              child: Text("No View!",
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const Color.fromRGBO(
                      107, 126, 130, 1),
                ),),
            ),
          ):Container(
            // width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(3),
              child:Html(
                data: htmlView
              ),
            ),
          ),
        ),
      ),
    );
  }
}
